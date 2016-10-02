;; Setup shell

;; 解决Emacs执行shell命令command not found的问题, 原因是.bashrc修改的path变量未起作用
;; Emacs默认以非交互式执行shell命令, 不读取.bashrc, -i指定以交互式启动bash, -c表示命令读取来自
;; 字符串, 可以通过设置BASH_ENV来指定非交互式shell的配置文件
;; bash中, 执行bash脚本的时候，如果BASH_ENV被设置的话，它就会先执行BASH_ENV指向的脚本
;; 说明: .bash_profile is loaded for your login shell only.
;; If you want to customize regular shells (such as xterm windows, or Emacs shells),
;; you need to put the customization in .bashrc instead.
;; Many people will source .bashrc from .bash_profile, so that you get all of
;; your customizations in your login shell, but only those in .bashrc in your regular shells.
(setq-default shell-command-switch "-ic")

;; Note: Emacs runs .bashrc in *shell*
;; So mac users should ln -s .profile .bashrc

;; bash-completion

(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
          'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
          'bash-completion-dynamic-complete)

;; tab-completion for shell-command

(require 'shell-command)
(shell-command-completion-mode)

;; C-d to kill buffer if process is dead.

(defun comint-delchar-or-eof-or-kill-buffer (arg)
  (interactive "p")
  (if (null (get-buffer-process (current-buffer)))
      (kill-buffer)
    (comint-delchar-or-maybe-eof arg)))

(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map (kbd "C-d") 'comint-delchar-or-eof-or-kill-buffer)))

(provide 'setup-shell)
