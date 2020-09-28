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

(defun js-insert-console-log (var)
  "Add console.log of `var' to point."
  (interactive "s请输入要打印的变量名: ")
  (insert (format "console.log('#### %s: ', %s);" var var))
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

(provide 'setup-js)
;;; setup-js.el ends here
