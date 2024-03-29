;;; setup-js.el --- tweak js settings -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(require 'nvm)
(require 'js-comint) ;; js repl
;; M-x js-comint-repl

;; (setq js-comint-program-command "C:/Program Files/nodejs/node.exe")

(js-do-use-nvm)

;; ;; for js-comint-repl
;; (add-hook 'js-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
;;             (local-set-key (kbd "C-c b") 'js-send-buffer)))

;; ;; for js-comint-repl
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
;;             (local-set-key (kbd "C-c b") 'js-send-buffer)))


;; for node.js repl
;; (add-hook 'js-mode
;;           (lambda ()
;;             (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)
;;             (define-key js-mode-map (kbd "C-c C-e") 'nodejs-repl-send-last-expression)
;;             (define-key js-mode-map (kbd "C-c C-c") 'nodejs-repl-send-region)))


;; eslint
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-mode 'javascript-eslint 'js-mode)
;; (flycheck-add-mode 'javascript-eslint 'js2-mode)
;; (flycheck-add-mode 'javascript-eslint 'graphql-mode)
;; (flycheck-add-mode 'javascript-eslint 'rjsx-mode)

;; js pretty-fier, pretty-print
(use-package js-auto-format-mode
  :config
  (custom-set-variables
  '(js-auto-format-command "prettier")
  '(js-auto-format-command-args "--write --single-quote --no-semi")))

;; or
;; (use-package prettier-js
;;   :demand t)
;; prettier-js-mode
;; or run prettier-js to format
(defun pretty-print-js ()
  (interactive)
  (js-auto-format-execute)
  ;; or
  ;;(prettier-js)
  )

(use-package rjsx-mode
  :init (add-to-list 'auto-mode-alist '("\\.jsx?$" . rjsx-mode))
  :bind
  (:map rjsx-mode-map
        ("C-c C-c" . js-insert-console-log)))

(use-package web-mode
  :init (add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))
  :bind
  (:map web-mode-map
        ("C-c C-c" . js-insert-console-log)))


(use-package typescript-mode
  :ensure t
  :config
  (setq typescript-indent-level 2))

(defun function-to-const ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (when (re-search-forward "function" (line-end-position) t 1)
      (replace-match "const"))
    (when (re-search-forward "(" (line-end-position) t 1)
      (replace-match " = ("))
    (when (re-search-forward "{" (line-end-position) t 1)
      (replace-match "=> {"))
    )
  )

(require 'js)
(require 'my-utils)
(append-to-list 'js--prettify-symbols-alist
             '(("=>" . 8658)
               ("<=" . 8804)
               (">=" . 8805)
               ("!=" . 8800)
               ("===" . 8801)
               ("!==" . 8802)
               ("function" . 402)
               ("&yen;" . 165)))

(add-hook 'js-mode 'prettify-symbols-mode)


(require 'commenter)
;; (setq comment-style 'extra-line)
(setq comment-style 'indent)
(add-hook 'js-mode-hook
          (lambda ()
            (setq-local commenter-config
                        '((single
                           . ((comment-start      . "//")
                              (comment-end        . "")
                              (comment-start-skip . "\\(//+\\|/\\*+\\)\\s *")))
                          (multi
                           . ((comment-start      . "/* ")
                              (comment-end        . " */")
                              (comment-start-skip . "/\\*")
                              (comment-end-skip   . "\\*/")
                              (comment-continue   . " * ")
                              (comment-padding    . " ")
                              (comment-multi-line . t)))))
            (commenter-setup)))

(provide 'setup-js)
;;; setup-js.el ends here
