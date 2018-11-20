(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-use-fuzzy nil)
 '(achievements-mode t)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(ansi-term-color-vector
   [unspecified "#1B2229" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#DFDFDF"] t)
 '(auto-completion-at-point-functions '(predictive-completion-at-point))
 '(beacon-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(buffer-flip-mode nil)
 '(cfs--current-profile "read-code" t)
 '(cfs--profiles-steps '(("unset" . 10) ("coding" . 8) ("read-code" . 9)) t)
 '(cider-lein-parameters "repl :headless :host localhost")
 '(compilation-message-face 'default)
 '(completion-auto-show '((t . completion-show-popup-tip)))
 '(completion-auto-show-delay '((t . 0)))
 '(completion-ui-use-echo '((t)))
 '(completion-ui-use-hotkeys '((t . auto-show)))
 '(custom-enabled-themes '(doom-nord-light))
 '(custom-safe-themes
   '("4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "2c88b703cbe7ce802bf6f0bffe3edbb8d9ec68fc7557089d4eaa1e29f7529fe1" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "a566448baba25f48e1833d86807b77876a899fc0c3d33394094cf267c970749f" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "b4c13d25b1f9f66eb769e05889ee000f89d64b089f96851b6da643cee4fdab08" "9d9fda57c476672acd8c6efeb9dc801abea906634575ad2c7688d055878e69d6" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "5f4e4c9f5de8156f964fdf8a1b8f8f659efbfeff88b38f49ce13953a84272b77" "a4e6940f5c63f3c6759d35e6534eaa26ff14512aa61616a0584bda9f858c60b9" "bb749a38c5cb7d13b60fa7fc40db7eced3d00aa93654d150b9627cabd2d9b361" "f03e2076bb6ba9f1178ef83f54b395c48c70dd160a34e37c80c876c925701b5a" "9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "227e2c160b0df776257e1411de60a9a181f890cfdf9c1f45535fc83c9b34406b" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "70403e220d6d7100bae7775b3334eddeb340ba9c37f4b39c189c2c29d458543b" "41d299ecdebddad8c0f9a54360be85f88d81d84520d3895c0b305c5fdf142d57" "c6bfd0e4dd8b6dd9a7a4a38d1c6d2a915fa106c09cf8a193ed22e080dcd407f7" "f01c338c47894a1bea1f1dbd8254d749818dcd977b17f0efeca9a8648b079543" "fe1682ca8f7a255cf295e76b0361438a21bb657d8846a05d9904872aa2fb86f2" "1a2cde373eff9ffd5679957c7ecfc6249d353e1ee446d104459e73e924fe0d8a" "f19d195fa336e9904303eea20aad35036b79cfde72fa6e76b7462706acd52920" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "30f8881108cd7ab3fd93e9f0327409eeaccfe2810101309be83ea7411dbb2323" "371ef67913caad1db355f6e63905b8619cabf54e0e6b09b39bec4a4090cda9b4" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default))
 '(debug-ignored-errors
   '("^Exit the snippet first!$" beginning-of-line beginning-of-buffer end-of-line end-of-buffer end-of-file buffer-read-only file-supersession mark-inactive user-error))
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(fci-rule-color "#383838")
 '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)
 '(frame-background-mode 'dark)
 '(global-undo-tree-mode t)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(jdee-compile-option-command-line-args `("-classpath" ,mindview-jar))
 '(jdee-compile-optioqn-command-line-args `("-classpath" ,mindview-jar))
 '(jdee-db-active-breakpoint-face-colors (cons "#10151C" "#5EC4FF"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#10151C" "#8BD49C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#10151C" "#384551"))
 '(jdee-run-option-application-args nil)
 '(jdee-run-option-boot-classpath nil)
 '(jdee-run-option-classpath `(,mindview-jar "."))
 '(jdee-server-dir "~/.emacs.d/jdee-server")
 '(json-reformat:indent-width 2)
 '(ledger-post-amount-alignment-at :decimal)
 '(ledger-post-amount-alignment-column 62)
 '(ledger-reports
   '(("2bal" "ledger -f %(ledger-file) -d \"l<=2\" bal")
     ("nbal" "ledger -f %(ledger-file) -n bal")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)")
     ("%" "ledger -f %(ledger-file) -%s -S T -d \"l<=2\" bal")))
 '(linum-format "%4d| ")
 '(magit-diff-use-overlays nil)
 '(org-agenda-files '("/Users/yuzhao/gits/org/"))
 '(org-ellipsis "  ")
 '(org-modules
   '(org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-protocol org-rmail org-w3m org-drill))
 '(package-selected-packages
   '(nix-mode org-drill-table org-drill bookmark+ impatient-mode rust-mode stream trie visual-fill-column achievements flycheck-plantuml plantuml-mode djvu apples-mode powerthesaurus goto-chg debug-print rjsx-mode cnfonts go-errcheck go-eldoc go-dlv go-mode typescript-mode eredis solidity-mode pdf-tools markdown-preview-mode markdown-preview-eww buffer-flip slack org-wunderlist log4e log4j-mode helpful help-mode+ help-fns+ help+ markdown-mode+ paredit-everywhere paredit-menu jdee helm-ag csharp-mode helm-cljr cljr-helm zpresent org-bookmark-heading org-beautify-theme org intero haskell-mode web-mode geiser tree-mode npm-mode doom-themes aggressive-indent pangu-spacing nrepl-eval-sexp-fu nrepl-sync monokai-theme darkokai-theme slim-mode coffee-mode racket-mode vlf magit niceify-info hledger-mode suggest hyperbole info+ org-alert alert helm-w3m w3m language-detection pinyin-search wolfram-mode jedi-direx jedi php-mode psysh sass-mode editorconfig vue-mode ace-jump-mode atomic-chrome adoc-mode swbuff-x el-get e2wm e2wm-bookmark helm-github-stars bug-hunter emms-player-mpv emms-soundcloud helm-emms emms helm-mt multi-term poker beacon helm-chrome helm-cider-history helm-clojuredocs use-package keyfreq smooth-scrolling git-timemachine company key-chord json-mode paper-theme yaml-mode blog-admin graphviz-dot-mode mic-paren rainbow-delimiters ac-cider auto-complete cider-eval-sexp-fu eval-sexp-fu align-cljlet uuid 4clojure helm-emmet emmet-mode smartscan helm-descbinds edit-server yesql-ghosts helm-cider core-async-mode clj-refactor js2-refactor js2-mode js-mode fill-column-indicator change-inner wgrep visual-regexp swiper-helm elisp-slime-nav whitespace-cleanup-mode highlight-escape-sequences smartparens smart-forward encourage-mode encourange-mode fic-mode multiple-cursors ledger-mode string-edit less-css-mode rainbow-mode clojure-mode-extra-font-locking sx flycheck-clojure flycheck-pos-tip helm-swoop helm-ls-git org-repo-todo helm-projectile helm-ack org-redmine helm-org-rifle golden-ratio-scroll-screen chinese-font-setup undo-tree diminish exec-path-from-shell restclient nodejs-repl guide-key flycheck move-text paredit dash helm))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(send-mail-function 'smtpmail-send-it)
 '(show-paren-mode t)
 '(smartscan-symbol-selector "symbol")
 '(tooltip-frame-parameters
   '((name . "tooltip")
     (internal-border-width . 2)
     (border-width . 1)
     (no-special-glyphs . t)
     (alpha . 50)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#d54e53")
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
     (360 . "DarkOliveGreen3")))
 '(vc-annotate-very-old-color nil)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-attr-value-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
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
