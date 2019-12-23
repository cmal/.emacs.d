;;; setup-haskell.el --- haskell related settings -*- lexical-binding: t; -*-

;;; Commentary:


;;; Code:

;; stack

;; executable path
;; (setq exec-path (append exec-path '("~/.local/bin")))

;; (add-to-list 'load-path "/Users/yuzhao/gits/structured-haskell-mode/elisp")
;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)

(require 'shm)
(define-key shm-map (kbd "RET") 'shm/newline-indent-proxy)
(define-key shm-map (kbd "C-<return>") 'shm/simple-indent-newline-indent)
(define-key shm-map (kbd "C-j") 'shm/ret-proxy)
(define-key shm-map (kbd "M-(") 'shm/wrap-parens)


(provide 'setup-haskell)
;;; setup-haskell.el ends here
