;; full screen magit-status

(use-package magit

  :config

  ;; don't prompt me

  ;; (set-default 'magit-push-always-verify nil)
  (set-default 'magit-revert-buffers 'silent)
  (comment
   (set-default 'magit-no-confirm '(stage-all-changes
                                    unstage-all-changes)))

  ;; move cursor into position when entering commit message

  (defun my/magit-cursor-fix ()
    (beginning-of-buffer)
    (when (looking-at "#")
      (forward-line 2)))

  (add-hook 'git-commit-mode-hook 'my/magit-cursor-fix)

  ;; full screen vc-annotate

  (defun vc-annotate-quit ()
    "Restores the previous window configuration and kills the vc-annotate buffer"
    (interactive)
    (kill-buffer)
    (jump-to-register :vc-annotate-fullscreen))

  (eval-after-load "vc-annotate"
    '(progn
       (defadvice vc-annotate (around fullscreen activate)
         (window-configuration-to-register :vc-annotate-fullscreen)
         ad-do-it
         (delete-other-windows))

       (define-key vc-annotate-mode-map (kbd "q") 'vc-annotate-quit)))

  (define-key global-map (kbd "C-c m") 'magit-status))

(provide 'setup-magit)
