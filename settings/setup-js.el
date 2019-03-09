;;; setup-js.el --- tweak js settings -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(require 'nvm)
(require 'js-comint) ;; js repl
;; M-x js-comint-repl

;; (setq js-comint-program-command "C:/Program Files/nodejs/node.exe")

(js-do-use-nvm)

;; for js-comint-repl
(add-hook 'js-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
            (local-set-key (kbd "C-c b") 'js-send-buffer)))

;; for js-comint-repl
(add-hook 'js2-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
            (local-set-key (kbd "C-c b") 'js-send-buffer)))


;; for node.js repl
;; (add-hook 'js-mode
;;           (lambda ()
;;             (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)
;;             (define-key js-mode-map (kbd "C-c C-e") 'nodejs-repl-send-last-expression)
;;             (define-key js-mode-map (kbd "C-c C-c") 'nodejs-repl-send-region)))


;; eslint
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(flycheck-add-mode 'javascript-eslint 'graphql-mode)
(flycheck-add-mode 'javascript-eslint 'rjsx-mode)

(provide 'setup-js)
;;; setup-js.el ends here
