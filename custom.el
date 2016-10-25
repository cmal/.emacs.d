(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(cfs--current-profile "read-code" t)
 '(cfs--profiles-steps (quote (("unset" . 10) ("coding" . 8) ("read-code" . 9))) t)
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes
   (quote
    ("52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "30f8881108cd7ab3fd93e9f0327409eeaccfe2810101309be83ea7411dbb2323" "371ef67913caad1db355f6e63905b8619cabf54e0e6b09b39bec4a4090cda9b4" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default)))
 '(fci-rule-color "#383838")
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(ledger-reports
   (quote
    (("2bal" "ledger -f %(ledger-file) -d \"l<=2\" bal")
     ("nbal" "ledger -f %(ledger-file) -n bal")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)")
     ("%" "ledger -f %(ledger-file) -%s -S T -d \"l<=2\" bal"))))
 '(package-selected-packages
   (quote
    (mic-paren rainbow-delimiters ac-cider auto-complete cider-eval-sexp-fu eval-sexp-fu align-cljlet uuid 4clojure helm-emmet emmet-mode smartscan web-mode helm-descbinds edit-server sicp yesql-ghosts helm-cider core-async-mode clj-refactor js2-refactor js2-mode js-mode fill-column-indicator change-inner wgrep visual-regexp swiper-helm elisp-slime-nav whitespace-cleanup-mode highlight-escape-sequences smartparens smart-forward encourage-mode encourange-mode fic-mode multiple-cursors ledger-mode string-edit less-css-mode rainbow-mode clojure-mode-extra-font-locking sx flycheck-clojure flycheck-pos-tip helm-swoop helm-ls-git org-repo-todo helm-projectile helm-ack org-redmine helm-org-rifle golden-ratio-scroll-screen chinese-fonts-setup chinese-font-setup undo-tree smooth-scrolling diminish exec-path-from-shell cider restclient nodejs-repl guide-key flycheck move-text paredit magit dash helm)))
 '(smartscan-symbol-selector "symbol"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "Green"))))
 '(diff-removed ((t (:foreground "Red"))))
 '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))))
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black")))))
