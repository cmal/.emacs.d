(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-use-fuzzy nil)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(buffer-flip-mode t)
 '(cfs--current-profile "read-code" t)
 '(cfs--profiles-steps (quote (("unset" . 10) ("coding" . 8) ("read-code" . 9))) t)
 '(custom-enabled-themes (quote (word-perfect)))
 '(custom-safe-themes
   (quote
    ("c6bfd0e4dd8b6dd9a7a4a38d1c6d2a915fa106c09cf8a193ed22e080dcd407f7" "f01c338c47894a1bea1f1dbd8254d749818dcd977b17f0efeca9a8648b079543" "fe1682ca8f7a255cf295e76b0361438a21bb657d8846a05d9904872aa2fb86f2" "1a2cde373eff9ffd5679957c7ecfc6249d353e1ee446d104459e73e924fe0d8a" "f19d195fa336e9904303eea20aad35036b79cfde72fa6e76b7462706acd52920" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "30f8881108cd7ab3fd93e9f0327409eeaccfe2810101309be83ea7411dbb2323" "371ef67913caad1db355f6e63905b8619cabf54e0e6b09b39bec4a4090cda9b4" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default)))
 '(electric-indent-mode t)
 '(fci-rule-color "#383838")
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(json-reformat:indent-width 2)
 '(ledger-reports
   (quote
    (("2bal" "ledger -f %(ledger-file) -d \"l<=2\" bal")
     ("nbal" "ledger -f %(ledger-file) -n bal")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)")
     ("%" "ledger -f %(ledger-file) -%s -S T -d \"l<=2\" bal"))))
 '(linum-format "%3d| ")
 '(package-selected-packages
   (quote
    (helm-mt multi-term poker beacon helm-chrome helm-cider-history helm-clojuredocs use-package markdown-preview-mode keyfreq smooth-scrolling git-timemachine company key-chord json-mode paper-theme yaml-mode blog-admin graphviz-dot-mode mic-paren rainbow-delimiters ac-cider auto-complete cider-eval-sexp-fu eval-sexp-fu align-cljlet uuid 4clojure helm-emmet emmet-mode smartscan web-mode helm-descbinds edit-server sicp yesql-ghosts helm-cider core-async-mode clj-refactor js2-refactor js2-mode js-mode fill-column-indicator change-inner wgrep visual-regexp swiper-helm elisp-slime-nav whitespace-cleanup-mode highlight-escape-sequences smartparens smart-forward encourage-mode encourange-mode fic-mode multiple-cursors ledger-mode string-edit less-css-mode rainbow-mode clojure-mode-extra-font-locking sx flycheck-clojure flycheck-pos-tip helm-swoop helm-ls-git org-repo-todo helm-projectile helm-ack org-redmine helm-org-rifle golden-ratio-scroll-screen chinese-fonts-setup chinese-font-setup undo-tree diminish exec-path-from-shell cider restclient nodejs-repl guide-key flycheck move-text paredit magit dash helm)))
 '(smartscan-symbol-selector "symbol")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "goldenrod")
     (60 . "#e7c547")
     (80 . "DarkOliveGreen3")
     (100 . "#70c0b1")
     (120 . "DeepSkyBlue1")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "goldenrod")
     (200 . "#e7c547")
     (220 . "DarkOliveGreen3")
     (240 . "#70c0b1")
     (260 . "DeepSkyBlue1")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "goldenrod")
     (340 . "#e7c547")
     (360 . "DarkOliveGreen3"))))
 '(vc-annotate-very-old-color nil))
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
