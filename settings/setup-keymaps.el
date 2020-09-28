;;; custom keymaps

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "M-z"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "M-`"))

;; (global-set-key (kbd "C-x C-b") 'switch-to-prev-buffer)
;; (global-set-key (kbd "C-x C-n") 'switch-to-next-buffer)
(define-key global-map (kbd "C-x C-b") 'switch-to-prev-buffer)
(define-key global-map (kbd "C-x C-n") 'switch-to-next-buffer)

;; wolfram
;; (use-package wolfram-mode
;;   :if mac-p
;;   :bind
;;   (:map wolfram-mode
;;         ("C-x C-e" . wolfram-send-last-mathexp)))

;; swbuff-x
;; (define-key global-map (kbd "C-S-u") 'swbuff-switch-to-next-buffer)
;; (define-key global-map (kbd "C-S-i") 'swbuff-switch-to-previous-buffer)
;; (define-key global-map (kbd "C-S-k") 'swbuff-kill-this-buffer)

;; goto-chg
(use-package goto-chg
  :config
  (global-set-key (kbd "C-x C-.") 'goto-last-change)
  (global-set-key (kbd "C-x C-,") 'goto-last-change-reverse))

;;; for iterm2
(use-package iterm2-keymap
  :if (not window-system))


(provide 'setup-keymaps)
