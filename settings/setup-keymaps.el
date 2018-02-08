;;; custom keymaps

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "M-z"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "M-`"))
;; disable input method
(global-unset-key (kbd "C-\\"))


;; (global-set-key (kbd "C-x C-b") 'switch-to-prev-buffer)
;; (global-set-key (kbd "C-x C-n") 'switch-to-next-buffer)
(define-key global-map (kbd "C-x C-b") 'switch-to-prev-buffer)
(define-key global-map (kbd "C-x C-n") 'switch-to-next-buffer)

(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)

;; move-text
;; (global-set-key (kbd "s-<up>") 'move-text-up)
;; (global-set-key (kbd "s-<down>") 'move-text-down)
(define-key global-map (kbd "s-<up>") 'move-text-up)
(define-key global-map (kbd "s-<down>") 'move-text-down)

;; helm-ls-git
(define-key helm-find-files-map (kbd "M-f") 'helm-ff-run-grep-ag)

;; wolfram
(define-key wolfram-mode-map (kbd "C-x C-e") 'wolfram-send-last-mathexp)

;; swbuff-x
(define-key global-map (kbd "C-S-u") 'swbuff-switch-to-next-buffer)
(define-key global-map (kbd "C-S-i") 'swbuff-switch-to-previous-buffer)
(define-key global-map (kbd "C-S-k") 'swbuff-kill-this-buffer)

;; visual-regexp
(define-key global-map (kbd "M-&") 'vr/query-replace)
;; (define-key global-map (kbd "M-/") 'vr/replace)

;; magit
(define-key global-map (kbd "C-c m") 'magit-status-fullscreen)

(provide 'setup-keymaps)
