(require 'multi-term)
(setq multi-term-program "/bin/zsh")

(require 'helm-mt)
(global-set-key (kbd "C-x t") 'helm-mt)
;; If you would like to run helm-mt when you do M-x term or M-x shell, then put this in your init file:
;; (helm-mt/reroute-terminal-functions t)
