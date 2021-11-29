;; eww
;; ================>
;; eww-syntax-highlighting
;; using language-detection
(require 'cl-lib)

(defun eww-tag-pre (dom)
  (let ((shr-folding-mode 'none)
        (shr-current-font 'default))
    (shr-ensure-newline)
    (insert (eww-fontify-pre dom))
    (shr-ensure-newline)))

(defun eww-fontify-pre (dom)
  (with-temp-buffer
    (shr-generic dom)
    (let ((mode (eww-buffer-auto-detect-mode)))
      (when mode
        (eww-fontify-buffer mode)))
    (buffer-string)))

(defun eww-fontify-buffer (mode)
  (delay-mode-hooks (funcall mode))
  (font-lock-default-function mode)
  (font-lock-default-fontify-region (point-min)
                                    (point-max)
                                    nil))

(defun eww-buffer-auto-detect-mode ()
  (let* ((map '((ada ada-mode)
                (awk awk-mode)
                (c c-mode)
                (cpp c++-mode)
                (clojure clojure-mode lisp-mode)
                (csharp csharp-mode java-mode)
                (css css-mode)
                (dart dart-mode)
                (delphi delphi-mode)
                (emacslisp emacs-lisp-mode)
                (erlang erlang-mode)
                (fortran fortran-mode)
                (fsharp fsharp-mode)
                (go go-mode)
                (groovy groovy-mode)
                (haskell haskell-mode)
                (html html-mode)
                (java java-mode)
                (javascript javascript-mode)
                (json json-mode javascript-mode)
                (latex latex-mode)
                (lisp lisp-mode)
                (lua lua-mode)
                (matlab matlab-mode octave-mode)
                (objc objc-mode c-mode)
                (perl perl-mode)
                (php php-mode)
                (prolog prolog-mode)
                (python python-mode)
                (r r-mode)
                (ruby ruby-mode)
                (rust rust-mode)
                (scala scala-mode)
                (shell shell-script-mode)
                (smalltalk smalltalk-mode)
                (sql sql-mode)
                (swift swift-mode)
                (visualbasic visual-basic-mode)
                (xml sgml-mode)))
         (language (language-detection-string
                    (buffer-substring-no-properties (point-min) (point-max))))
         (modes (cdr (assoc language map)))
         (mode (cl-loop for mode in modes
                        when (fboundp mode)
                        return mode)))
    (message (format "%s" language))
    (when (fboundp mode)
      mode)))

(setq shr-external-rendering-functions
      '((pre . eww-tag-pre)))

;; end of eww-syntax-highlighting
;; <================


;; w3m

(defun load-w3m ()
  (when mac-p
    (require 'w3m)
    ;; (add-hook 'w3m-mode-hook
    ;;           (lambda ()
    ;;             (setq w3m-new-session-in-background t)
    ;;             (setq-local mouse-1-click-follows-link nil)
    ;;             (local-set-key [backspace] #'w3m-view-previous-page)
    ;;             (local-set-key (kbd "<C-tab>") #'w3m-next-buffer)
    ;;             (local-set-key [mouse-1] #'w3m-mouse-view-this-url)
    ;;             (local-set-key [mouse-2] #'w3m-mouse-view-this-url-new-session)))

    (setq-default w3m-fill-column 80)))

;; use T to toggle image display

;; =======================================================
;; Cakecrumbs
;; =======================================================
;; Specify all major-mode (`cakecrumbs' decide how to deal with
;; cursor's context by variable `major-mode'.)
(require 'cakecrumbs)
(setq cakecrumbs-html-major-modes   '(html-mode web-mode nxml-mode sgml-mode))
(setq cakecrumbs-jade-major-modes   '(yajade-mode jade-mode pug-mode))
(setq cakecrumbs-scss-major-modes   '(scss-mode less-css-mode css-mode))
(setq cakecrumbs-stylus-major-modes '(stylus-mode sass-mode))  ; currently, sass-mode use the same rule with stylus-mode

;; Auto `add-hook' for above major-mode.  (Auto enable `cakecrumbs'
;; for the major-modes which have specify in above variables)
;; This automatically do this for you:
;; (add-hook 'MODE-HOOK 'cakecrumbs-enable-if-disabled)
(cakecrumbs-auto-setup)

;; Set to number to refresh after idling N seconds.
;; Set to nil, refresh without any delay.
(setq cakecrumbs-refresh-delay-seconds 0.1)

;; Appearances
(setq cakecrumbs-separator " | ")
(setq cakecrumbs-ellipsis "[...] ")

;; Ignore some patterns in selector string
(setq cakecrumbs-ignored-patterns
      '(
        "[.]col-[a-z][a-z]-[0-9]+"  ; Bootstrap's .col-*
        ))

(require 'cedit) ;; paredit for c like

(provide 'setup-web)
