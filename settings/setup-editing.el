
(setq-default delete-by-moving-to-trash t)

;; Move to trash when deleting stuff
(when is-mac 
  (setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs"))

(add-hook 'view-mode-hook
          (lambda() (set-fringe-mode 0)))
(global-set-key (kbd "s-p") 'scroll-down-line)
(global-set-key (kbd "s-n") 'scroll-up-line)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "<s-mouse-1>") 'mc/add-cursor-on-click)

(require 'smart-forward)

(require 'golden-ratio-scroll-screen)
(global-set-key [remap scroll-down-command] 'golden-ratio-scroll-screen-down)
(global-set-key [remap scroll-up-command] 'golden-ratio-scroll-screen-up)

 ;; highlight FIXME TODO BUG (...)
(require 'fic-mode)
(add-hook 'prog-mode-hook 'fic-mode)

;; auto indent
;; (defun set-newline-and-indent ()
;; ;;  (local-set-key (kbd "RET") 'newline-and-indent))
;;   (local-set-key (kbd "RET") 'electric-newline-and-maybe-indent))
(electric-indent-mode)

;; (add-hook 'prog-mode-hook 'set-newline-and-indent)
;; (remove-hook 'prog-mode-hook 'set-newline-and-indent)
(add-hook 'prog-mode-hook 'linum-mode)

(display-time-mode 1)
(encourage-mode)

;; move-text
;; (move-text-default-bindings)


;; comment code
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

(global-whitespace-cleanup-mode)

(set-default 'truncate-lines t)
(require 'smartscan)
(global-smartscan-mode)

(provide 'setup-editing)
