;; tell clj-refactor not to eagerly eval namespaces
;; on connection (this totally conflicts with Overtone
;; namespaces that have ready-to-sound side-effecting
;; functions!
;; (setq cljr-eagerly-build-asts-on-startup nil)
;; (setq cljr-inject-dependencies-at-jack-in nil)

;; (require 'clj-refactor)
;; wiki of clj-refactor
;; https://github.com/clojure-emacs/clj-refactor.el/wiki

;; (require 'cljr-helm)  ;; helm helper used by clojure-refactor
;; (define-key clojure-mode-map (kbd "C-c C-r") 'cljr-helm)


(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1)
                                               ;; "∈"
                                               "Ø"
                                               )
                               nil))))))

(comment
 (eval-after-load 'clojure-mode
   '(progn
      (font-lock-remove-keywords
       'clojure-mode `(("\\(#\\){"
                        (0 (progn (compose-region (match-beginning 1)
                                                  (match-end 1) "∈")
                                  nil)))))
      (font-lock-add-keywords
       'clojure-mode `(("\\(#\\){"
                        (0 (progn (compose-region (match-beginning 1)
                                                  (match-end 1) "Ø")
                                  nil))))))))

(eval-after-load 'find-file-in-project
  '(add-to-list 'ffip-patterns "*.clj"))

(require 'clojure-mode)

(add-hook 'clojure-mode-hook
          (lambda ()
            (setq buffer-save-without-query t)))

;;command to align let statements
;;To use: M-x align-cljlet
(require 'align-cljlet)

;;Treat hyphens as a word character when transposing words
(defvar clojure-mode-with-hyphens-as-word-sep-syntax-table
  (let ((st (make-syntax-table clojure-mode-syntax-table)))
    (modify-syntax-entry ?- "w" st)
    st))

(defun live-transpose-words-with-hyphens (arg)
  "Treat hyphens as a word character when transposing words"
  (interactive "*p")
  (with-syntax-table clojure-mode-with-hyphens-as-word-sep-syntax-table
    (transpose-words arg)))

(define-key clojure-mode-map (kbd "M-t") 'live-transpose-words-with-hyphens)

(defun live-warn-when-cider-not-connected ()
  (interactive)
  (message "nREPL server not connected. Run M-x cider or M-x cider-jack-in to connect."))

(define-key clojure-mode-map (kbd "C-M-x")   'live-warn-when-cider-not-connected)
(define-key clojure-mode-map (kbd "C-x C-e") 'live-warn-when-cider-not-connected)
(define-key clojure-mode-map (kbd "C-c C-e") 'live-warn-when-cider-not-connected)
(define-key clojure-mode-map (kbd "C-c C-l") 'live-warn-when-cider-not-connected)
;;(define-key clojure-mode-map (kbd "C-c C-r") 'live-warn-when-cider-not-connected)

;; hs-minor-mode
(defun hs-clojure-hide-namespace-and-folds ()
  "Hide the first (ns ...) expression in the file, and also all
the (^:fold ...) expressions."
  (interactive)
  (hs-life-goes-on
   (save-excursion
     (goto-char (point-min))
     (when (ignore-errors (re-search-forward "^(ns "))
       (hs-hide-block))

     (while (ignore-errors (re-search-forward "\\^:fold"))
       (hs-hide-block)
       (next-line)))))

(defun hs-clojure-mode-hook ()
  (interactive)
  (hs-minor-mode 1)
  (hs-clojure-hide-namespace-and-folds))
;; (add-hook 'clojure-mode-hook 'hs-clojure-mode-hook)

;; (add-hook 'clojure-mode-hook 'clj-refactor-mode)
(add-hook 'clojure-mode-hook 'yas-minor-mode) ;; needed by clj-refactor-mode

;; (setq cljr-magic-require-namespaces
;;       '(("io"   . "clojure.java.io")
;;         ("set"  . "clojure.set")
;;         ("s"  . "clojure.string")
;;         ("walk" . "clojure.walk")
;;         ("zip"  . "clojure.zip")
;;         ("time" . "clj-time.core")
;;         ("log"  . "clojure.tools.logging")
;;         ("json" . "cheshire.core")))

(require 'clojure-mode-extra-font-locking)
(setq clojure-align-forms-automatically t)

;; sayid: clojure profiler and debugger
;; add this to `project.clj`:
;; [com.billpiel/sayid "0.0.15"]
;; and uncomment the following s-exp
;; (eval-after-load 'clojure-mode
;;   '(sayid-setup-package))

;; clomacs: ELisp <-> Clojure
;; see https://github.com/clojure-emacs/clomacs
;;(use-package clomacs
;;  :ensure t)
;; (add-to-list 'load-path "~/gits/dingtalk-clj/clomacs-demo/src/elisp/")
;; (require 'clomacs-demo)


(provide 'setup-clojure-mode)
