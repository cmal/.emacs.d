(require 'spinner)

(require 'cider)
(require 'cider-apropos)
(require 'cider-macroexpansion)
(require 'cider-browse-ns)
(require 'cider-classpath)

(defun live-windows-hide-eol ()
 "Do not show ^M in files containing mixed UNIX and DOS line endings."
 (interactive)
 (setq buffer-display-table (make-display-table))
 (aset buffer-display-table ?\^M []))

(when (eq system-type 'windows-nt)
  (add-hook 'nrepl-mode-hook 'live-windows-hide-eol ))

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (paredit-mode 1)))

(add-hook 'cider-mode-hook
           (lambda ()
             (paredit-mode 1)))

(setq cider-popup-stacktraces t)
(setq cider-popup-stacktraces-in-repl t)
(add-to-list 'same-window-buffer-names "*cider*")
(setq cider-overlays-use-font-lock t)

;;Auto Complete
;; (require 'ac-cider )

;; (add-hook 'cider-mode-hook 'ac-cider-setup)
;; (add-hook 'cider-repl-mode-hook 'ac-cider-setup)

;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-mode))

;; company mode
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; Specify the print length to be 100 to stop infinite sequences killing
;; things. This might be dangerous for some people relying on
;; *print-length* being larger. Consider a work around
;; (defun live-nrepl-set-print-length ()
;;   (nrepl-send-string-sync "(set! *print-length* 100)" "clojure.core"))

;; (add-hook 'nrepl-connected-hook 'live-nrepl-set-print-length)

(setq nrepl-port "7022")
(setq cider-repl-history-file "~/cider-history-file.clj")

;; Pull in the awesome clj-refactor lib by magnars
;; (require 'jump)

(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-m")))

(define-key clojure-mode-map (kbd "C-:") 'cljr-cycle-stringlike)
(define-key clojure-mode-map (kbd "C->") 'cljr-cycle-coll)



;; highlight expression on eval
(require 'highlight)
(require 'eval-sexp-fu)
(require 'cider-eval-sexp-fu)

(setq eval-sexp-fu-flash-duration 0.5)

(defun live-bounds-of-preceding-sexp ()
  "Return the bounds of sexp before the point. Copies semantics
   directly from the fn preceding-sexp to ensure highlighted area
   is identical to that which is evaluated."
  (let ((opoint (point))
        ignore-quotes
        expr)
    (save-excursion
      (with-syntax-table emacs-lisp-mode-syntax-table
        ;; If this sexp appears to be enclosed in `...'
        ;; then ignore the surrounding quotes.
        (setq ignore-quotes
              (or (eq (following-char) ?\')
                  (eq (preceding-char) ?\')))
        (forward-sexp -1)
        ;; If we were after `?\e' (or similar case),
        ;; use the whole thing, not just the `e'.
        (when (eq (preceding-char) ?\\)
          (forward-char -1)
          (when (eq (preceding-char) ??)
            (forward-char -1)))

        ;; Skip over hash table read syntax.
        (and (> (point) (1+ (point-min)))
             (looking-back "#s" (- (point) 2))
             (forward-char -2))

        ;; Skip over `#N='s.
        (when (eq (preceding-char) ?=)
          (let (labeled-p)
            (save-excursion
              (skip-chars-backward "0-9#=")
              (setq labeled-p (looking-at "\\(#[0-9]+=\\)+")))
            (when labeled-p
              (forward-sexp -1))))

        (save-restriction
          ;; vladimir@cs.ualberta.ca 30-Jul-1997: skip ` in
          ;; `variable' so that the value is returned, not the
          ;; name
          (if (and ignore-quotes
                   (eq (following-char) ?`))
              (forward-char))
          (cons (point) opoint))))))

(defun live-bounds-of-defun ()
  "Return the bounds of the defun around point. Copies semantics
   directly from the fn eval-defun-2 to ensure highlighted area
   is identical to that which is evaluated."
  (save-excursion
    (end-of-defun)
    (beginning-of-defun)
    (setq beg (point))
    (read (current-buffer))
    (setq end (point))
    (cons beg end)))

;; fix up esf to highlight exactly what emacs evaluates
(defun live-esf-initialize-elisp ()
  (define-eval-sexp-fu-flash-command eval-last-sexp
    (eval-sexp-fu-flash (when (ignore-errors (elisp--preceding-sexp))
                          (with-esf-end-of-sexp
                            (live-bounds-of-preceding-sexp)))))
  (define-eval-sexp-fu-flash-command eval-defun
    (eval-sexp-fu-flash (live-bounds-of-defun))))

(live-esf-initialize-elisp)

;; cider extensions


(defun live-bounds-of-cider-last-sexp ()
  "Return the bounds of the defun around point. Copies semantics
   directly from the fn cider-last-sexp to ensure highlighted
   area is identical to that which is evaluated."
  (cons (save-excursion (backward-sexp) (point)) (point)))

(defun live-esf-initialize-cider ()
  (define-eval-sexp-fu-flash-command cider-eval-last-sexp
    (eval-sexp-fu-flash (live-bounds-of-cider-last-sexp)))

  (define-eval-sexp-fu-flash-command cider-pprint-eval-last-sexp
    (eval-sexp-fu-flash (live-bounds-of-cider-last-sexp)))

  (progn
    ;; Defines:
    ;; `eval-sexp-fu-cider-sexp-inner-list',
    ;; `eval-sexp-fu-cider-sexp-inner-sexp'
    ;; and the pprint variants respectively.
    (define-eval-sexp-fu-eval-sexp eval-sexp-fu-cider-eval-sexp
      cider-eval-last-sexp)
    (define-eval-sexp-fu-eval-sexp eval-sexp-fu-cider-pprint-eval-sexp
      cider-pprint-eval-last-sexp)))

(eval-after-load 'cider
  '(live-esf-initialize-cider))


;; clojurescript and figwheel settings

;; (defun cider-figwheel-repl ()
;;   (interactive)
;;   (save-some-buffers)
;;   (with-current-buffer (cider-current-repl-buffer)
;;     (goto-char (point-max))
;;     (insert "(require 'figwheel-sidecar.repl-api)
;;              (figwheel-sidecar.repl-api/start-figwheel!) ; idempotent
;;              (figwheel-sidecar.repl-api/cljs-repl)")
;;     (cider-repl-return)))


;; ;; Additionally there are times where you want to send block
;; ;; directly to the browser (as opposed to evaluating them in Emacs).

;; (defun user/cider-send-to-repl ()
;;   (interactive)
;;   (let ((s (buffer-substring-no-properties
;;             (nth 0 (cider-last-sexp 'bounds))
;;             (nth 1 (cider-last-sexp 'bounds)))))
;;     (with-current-buffer (cider-current-connection)
;;       (insert s)
;;       (cider-repl-return))))

;; (add-hook 'clojurescript-mode-hook
;;           (lambda ()
;;             (do
;;                 (local-set-key (kbd "C-c C-f") 'cider-figwheel-repl)
;;                 (local-set-key (kbd "C-c C-s") 'user/cider-send-to-repl))))

(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")

(setq cider-cljs-lein-repl
      "(do (use 'figwheel-sidecar.repl-api)
           (start-figwheel!)
           (cljs-repl))")


;; clojurescript when figwheel connected
(defun cider-send-to-repl ()
  (interactive)
  (let ((s (buffer-substring-no-properties
            (nth 0 (cider-last-sexp 'bounds))
            (nth 1 (cider-last-sexp 'bounds)))))
    (with-current-buffer (cider-current-connection)
      (insert s)
      (cider-repl-return))))

(define-key clojure-mode-map (kbd "C-c C-l") 'cider-send-to-repl)

(require 'adoc-mode)
;; reading asciidoc book
(defun increment-clojure-cookbook ()
  "When reading the Clojure cookbook, find the next section, and
close the buffer. If the next section is a sub-directory or in
the next chapter, open Dired so you can find it manually."
  (interactive)
  (let* ((cur (buffer-name))
         (split-cur (split-string cur "[-_]"))
         (chap (car split-cur))
         (rec (car (cdr split-cur)))
         (rec-num (string-to-number rec))
         (next-rec-num (1+ rec-num))
         (next-rec-s (number-to-string next-rec-num))
         (next-rec (if (< next-rec-num 10)
                       (concat "0" next-rec-s)
                     next-rec-s))
         (target (file-name-completion (concat chap "-" next-rec) "")))
    (progn
      (if (equal target nil)
          (dired (file-name-directory (buffer-file-name)))
        (find-file target))
      (kill-buffer cur))))

(define-key adoc-mode-map (kbd "M-+") 'increment-clojure-cookbook)

;; Of course, this binding assumes you're using adoc-mode for reading
;; .asciidoc files. We suggest CIDER for evaluating code interactively.
;; Adding the following hook to your config will enable cider-mode every
;; time you enter an AsciiDoc file. Once active, you can start a REPL
;; and evaluate code like you would do in any regular Clojure file.
(add-hook 'adoc-mode-hook 'cider-mode)

(provide 'setup-cider)
