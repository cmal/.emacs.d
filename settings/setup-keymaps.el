;;; custom keymaps

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "M-`"))

(global-set-key (kbd "C-x C-b") 'switch-to-prev-buffer)
(global-set-key (kbd "C-x C-n") 'switch-to-next-buffer)

(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)

(provide 'setup-keymaps)
