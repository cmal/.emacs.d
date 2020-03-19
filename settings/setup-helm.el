;; helm from https://github.com/emacs-helm/helm

(use-package helm
  :ensure t
  :after (helm)
  :bind
  (:map global-map
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ;; and this one find those git registered files
  ("C-x f" . helm-ls-git-ls))
  :config
  (require 'helm-config)
  (setq helm-buffers-fuzzy-matching t)
  (helm-mode 1)
  (helm-autoresize-mode t)
  )

(use-package helm-descbinds
  :config
  (helm-descbinds-mode))

(use-package wgrep-helm
  :after (helm))


;; NOTE: removed swiper swoop here


(use-package helm-emmet
  :after (helm))

(use-package helm-github-stars
  :after (helm)
  :config
  ;; Setup your github username:
  (setq helm-github-stars-username "cmal"))

;; https://emacs.stackexchange.com/questions/50416/can-helm-ag-commands-ignore-git-submodules/50426#50426
;; adding a .agignore (or .ignore if you use ag 2.0.0) to the root of
;; your project with a list of folders that you want to ignore.
(use-package helm-ag
  :init
  (setq helm-ag-insert-at-point 'symbol)
  :after (helm)
  :config
  (setq helm-ag-use-grep-ignore-list t)
  (global-set-key (kbd "C-x a g") 'helm-ag))

;; NOTE: ag may use http://sljit.sourceforge.net/pcre.html as regexp compiler
;; PCRE: http://www.pcre.org/ is Perl Compatible Regular Expressions
;; or refer to http://www.troubleshooters.com/codecorn/littperl/perlreg.htm

(use-package helm-ls-git
  :after (helm)
  :bind
  (:map helm-find-files-map
        ("M-f" . helm-ff-run-grep-ag)))

(provide 'setup-helm)
;;; setup-helm.el ends here
