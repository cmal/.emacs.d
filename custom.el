(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-use-fuzzy nil)
 '(ace-window-display-mode t)
 '(achievements-mode t)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(ansi-term-color-vector
   [unspecified "#1B2229" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#DFDFDF"] t)
 '(auto-completion-at-point-functions (quote (predictive-completion-at-point)))
 '(beacon-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(buffer-flip-mode nil)
 '(cfs--current-profile "read-code" t)
 '(cfs--profiles-steps (quote (("unset" . 10) ("coding" . 8) ("read-code" . 9))) t)
 '(cider-lein-parameters "repl :headless :host localhost")
 '(cider-repl-use-clojure-font-lock nil)
 '(cnfonts-personal-fontnames
   (quote
    (("三极竹枝简体" "三极柔宋简体" "Fixedsys Excelsior 3.01")
     ("三极竹枝简体" "三极柔宋简体" "Fixedsys Excelsior 3.01")
     nil)))
 '(compilation-message-face (quote default))
 '(completion-auto-show (quote ((t . completion-show-popup-tip))))
 '(completion-auto-show-delay (quote ((t . 0))))
 '(completion-ui-use-echo (quote ((t))))
 '(completion-ui-use-hotkeys (quote ((t . auto-show))))
 '(custom-enabled-themes (quote (doom-nord)))
 '(custom-safe-themes
   (quote
    ("f9cae16fd084c64bf0a9de797ef9caedc9ff4d463dd0288c30a3f89ecf36ca7e" "845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "361f5a2bc2a7d7387b442b2570b0ef35198442b38c2812bf3c70e1e091771d1a" "0ad7f1c71fd0289f7549f0454c9b12005eddf9b76b7ead32a24d9cb1d16cbcbd" "1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "a83f05e5e2f2538376ea2bfdf9e3cd8b7f7593b16299238c1134c1529503fa88" "a339f231e63aab2a17740e5b3965469e8c0b85eccdfb1f9dbd58a30bdad8562b" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "229c5cf9c9bd4012be621d271320036c69a14758f70e60385e87880b46d60780" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "3e3a1caddeee4a73789ff10ba90b8394f4cd3f3788892577d7ded188e05d78f4" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" "de43de35da390617a5b3e39b6b27c107cc51271eb95cceb1f43d13d9647c911d" "b9dda6ca36e825766dfada5274cf18d8a5bce70676b786e3260094e0cd8c0e62" "5091eadbb87fa0a168a65f2c3e579d1a648d764f12ab9d3ab7bdefca709cd2a5" "1ca1f43ca32d30b05980e01fa60c107b02240226ac486f41f9b790899f6f6e67" "f7b230ac0a42fc7e93cd0a5976979bd448a857cd82a097048de24e985ca7e4b2" "e7666261f46e2f4f42fd1f9aa1875bdb81d17cc7a121533cad3e0d724f12faf2" "0fe9f7a04e7a00ad99ecacc875c8ccb4153204e29d3e57e9669691e6ed8340ce" "fe76f3d5094967034192f6a505085db8db6deb0e135749d9a54dc488d6d3ee2f" "4b0b568d63b1c6f6dddb080b476cfba43a8bbc34187c3583165e8fb5bbfde3dc" "dd854be6626a4243375fd290fec71ed4befe90f1186eb5b485a9266011e15b29" "2c4222fc4847588deb57ce780767fac376bbf5bdea5e39733ff5e380a45e3e46" "5c9a906b076fe3e829d030a404066d7949e2c6c89fc4a9b7f48c054333519ee7" "e47c0abe03e0484ddadf2ae57d32b0f29f0b2ddfe7ec810bd6d558765d9a6a6c" "bc99493670a29023f99e88054c9b8676332dda83a37adb583d6f1e4c13be62b8" "32fd809c28baa5813b6ca639e736946579159098d7768af6c68d78ffa32063f4" "1897b97f63e91a792e8540c06402f29d5edcbfb0aafd64b1b14270663d6868ee" "53f8223005ceb058848fb92c2c4752ffdfcd771f8ad4324b3d0a4674dec56c44" "15ba8081651869ec689c9004288bed79003de5b4ee9c51a9d4a208d9e3439706" "468e235ebcb0d75e8bc0849e6b8a0bf5e8560ba3180b17ce21599d60a35e5816" "a02836a5807a687c982d47728e54ff42a91bc9e6621f7fe7205b0225db677f07" "a4fa3280ffa1f2083c5d4dab44a7207f3f7bcb76e720d304bd3bd640f37b4bef" "c6b93ff250f8546c7ad0838534d46e616a374d5cb86663a9ad0807fd0aeb1d16" "92d8a13d08e16c4d2c027990f4d69f0ce0833c844dcaad3c8226ae278181d5f3" "a4b9eeeabde73db909e6b080baf29d629507b44276e17c0c411ed5431faf87dd" "9d54f3a9cf99c3ffb6ac8e84a89e8ed9b8008286a81ef1dbd48d24ec84efb2f1" "b60f08ddc98a95485ec19f046a81d5877b26ab80a67782ea5b91a00ea4f52170" "bbb2b9b5d248ef6666abe409a58b75024121de77c27df09f188bfc29d8384433" "43c808b039893c885bdeec885b4f7572141bd9392da7f0bd8d8346e02b2ec8da" "4ea0aa360264ff861fb0212abe4161b83ad1d8c8b74d8a04bcd1baf0ebdceeae" "5d84ef8afded2cb54c77d21d6eb40a8a8356e4d490667ecc0de553e64e9f8292" "2f0cbe053485bccbbbb582acdba7c7c9585ad808ee8ab32f0d727c3d39b42275" "f8c30fa07ba7e8fe884f22b428dae6724955fa61ad84a658c3b0164ae391fb52" "34c99997eaa73d64b1aaa95caca9f0d64229871c200c5254526d0062f8074693" "ab9456aaeab81ba46a815c00930345ada223e1e7c7ab839659b382b52437b9ea" "ef4edbfc3ec509612f3cf82476beddd2aeb3da7bdc3a35726337a0cc838a4ef4" "e3c87e869f94af65d358aa279945a3daf46f8185f1a5756ca1c90759024593dd" "e838d6375a73fda607820c65eb3ea1f9336be7bd9a5528c9161e10c4aa663b5b" "4e132458143b6bab453e812f03208075189deca7ad5954a4abb27d5afce10a9a" "d0c943c37d6f5450c6823103544e06783204342430a36ac20f6beb5c2a48abe3" "db10381a554231a40b7474eaac28bd58f05067faacce3b25d294bb179a3511a1" "868abc288f3afe212a70d24de2e156180e97c67ca2e86ba0f2bf9a18c9672f07" "427fa665823299f8258d8e27c80a1481edbb8f5463a6fb2665261e9076626710" "614e5089876ea69b515c50b6d7fa0a37eb7ed50fda224623ec49e1c91a0af6a1" "cb477d192ee6456dc2eb5ca5a0b7bd16bdb26514be8f8512b937291317c7b166" "8c847a5675ece40017de93045a28ebd9ede7b843469c5dec78988717f943952a" "a16e816774b437acb78beb9916a60ea236cfcd05784227a7d829623f8468c5a2" "b0fd04a1b4b614840073a82a53e88fe2abc3d731462d6fde4e541807825af342" "9c27124b3a653d43b3ffa088cd092c34f3f82296cf0d5d4f719c0c0817e1afa6" "155a5de9192c2f6d53efcc9c554892a0d87d87f99ad8cc14b330f4f4be204445" "fd944f09d4d0c4d4a3c82bd7b3360f17e3ada8adf29f28199d09308ba01cc092" "10461a3c8ca61c52dfbbdedd974319b7f7fd720b091996481c8fb1dded6c6116" "49ec957b508c7d64708b40b0273697a84d3fee4f15dd9fc4a9588016adee3dad" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "2c88b703cbe7ce802bf6f0bffe3edbb8d9ec68fc7557089d4eaa1e29f7529fe1" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "a566448baba25f48e1833d86807b77876a899fc0c3d33394094cf267c970749f" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "b4c13d25b1f9f66eb769e05889ee000f89d64b089f96851b6da643cee4fdab08" "9d9fda57c476672acd8c6efeb9dc801abea906634575ad2c7688d055878e69d6" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "5f4e4c9f5de8156f964fdf8a1b8f8f659efbfeff88b38f49ce13953a84272b77" "a4e6940f5c63f3c6759d35e6534eaa26ff14512aa61616a0584bda9f858c60b9" "bb749a38c5cb7d13b60fa7fc40db7eced3d00aa93654d150b9627cabd2d9b361" "f03e2076bb6ba9f1178ef83f54b395c48c70dd160a34e37c80c876c925701b5a" "9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "227e2c160b0df776257e1411de60a9a181f890cfdf9c1f45535fc83c9b34406b" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "70403e220d6d7100bae7775b3334eddeb340ba9c37f4b39c189c2c29d458543b" "41d299ecdebddad8c0f9a54360be85f88d81d84520d3895c0b305c5fdf142d57" "c6bfd0e4dd8b6dd9a7a4a38d1c6d2a915fa106c09cf8a193ed22e080dcd407f7" "f01c338c47894a1bea1f1dbd8254d749818dcd977b17f0efeca9a8648b079543" "fe1682ca8f7a255cf295e76b0361438a21bb657d8846a05d9904872aa2fb86f2" "1a2cde373eff9ffd5679957c7ecfc6249d353e1ee446d104459e73e924fe0d8a" "f19d195fa336e9904303eea20aad35036b79cfde72fa6e76b7462706acd52920" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "30f8881108cd7ab3fd93e9f0327409eeaccfe2810101309be83ea7411dbb2323" "371ef67913caad1db355f6e63905b8619cabf54e0e6b09b39bec4a4090cda9b4" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default)))
 '(debug-ignored-errors
   (quote
    ("^Exit the snippet first!$" beginning-of-line beginning-of-buffer end-of-line end-of-buffer end-of-file buffer-read-only file-supersession mark-inactive user-error)))
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(fci-rule-color "#6272a4")
 '(flycheck-display-errors-function (function flycheck-tooltip-error-messages))
 '(frame-background-mode (quote dark))
 '(global-undo-tree-mode t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(isearch ((t (:inherit underline))))
 '(isearch-lazy-highlight nil)
 '(jdee-compile-option-command-line-args (\` ("-classpath" (\, mindview-jar))))
 '(jdee-compile-optioqn-command-line-args (\` ("-classpath" (\, mindview-jar))))
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(jdee-run-option-application-args nil)
 '(jdee-run-option-boot-classpath nil)
 '(jdee-run-option-classpath (\` ((\, mindview-jar) ".")))
 '(jdee-server-dir "~/.emacs.d/jdee-server")
 '(js-auto-format-command "prettier")
 '(js-auto-format-command-args "--write --single-quote --no-semi")
 '(js2-mode-show-parse-errors nil)
 '(json-reformat:indent-width 2)
 '(lazy-highlight ((t (:background "#5E81AC" :foreground "#F0F4FC"))))
 '(ledger-post-amount-alignment-at :decimal)
 '(ledger-post-amount-alignment-column 62)
 '(ledger-reports
   (quote
    (("2bal" "ledger -f %(ledger-file) -d \"l<=2\" bal")
     ("nbal" "ledger -f %(ledger-file) -n bal")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)")
     ("%" "ledger -f %(ledger-file) -%s -S T -d \"l<=2\" bal"))))
 '(linum-format "%4d| ")
 '(magit-diff-use-overlays nil)
 '(objed-cursor-color "#ff5555")
 '(org-agenda-files
   (quote
    ("/Users/yuzhao/gits/eleme-newretail-c-h5/pg-shop/TODO.org")))
 '(org-ellipsis "  ")
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-protocol org-rmail org-w3m org-drill)))
 '(package-selected-packages
   (quote
    (vue-mode marionette code-stats youdao-dictionary helm-git-grep prettier-js clomacs nov wgrep-helm helm-cljouredocs lsp-java dap-mode posframe sbt-mode scala-mode org-plus-contrib utop tuareg ediprolog search-web ghc elisp-demos flutter dart-mode flymd poporg elm-mode livereload sicp lsp-rust lsp-python graphql-mode company-lsp org-drill-table org-drill bookmark+ impatient-mode stream trie achievements flycheck-plantuml djvu apples-mode goto-chg debug-print cnfonts go-errcheck go-eldoc go-dlv go-mode eredis pdf-tools markdown-preview-mode markdown-preview-eww buffer-flip org-wunderlist log4e log4j-mode helpful help-mode+ help-fns+ help+ markdown-mode+ paredit-everywhere paredit-menu helm-ag csharp-mode helm-cljr cljr-helm zpresent org-bookmark-heading org-beautify-theme haskell-mode geiser tree-mode npm-mode doom-themes nrepl-eval-sexp-fu nrepl-sync darkokai-theme slim-mode coffee-mode niceify-info hledger-mode suggest info+ org-alert alert helm-w3m language-detection pinyin-search wolfram-mode sass-mode ace-jump-mode atomic-chrome adoc-mode swbuff-x el-get e2wm e2wm-bookmark helm-github-stars bug-hunter emms-player-mpv emms-soundcloud helm-emms helm-mt multi-term poker beacon helm-chrome helm-cider-history helm-clojuredocs use-package keyfreq smooth-scrolling key-chord paper-theme blog-admin graphviz-dot-mode mic-paren ac-cider auto-complete cider-eval-sexp-fu eval-sexp-fu align-cljlet uuid 4clojure helm-emmet emmet-mode smartscan helm-descbinds edit-server yesql-ghosts helm-cider core-async-mode clj-refactor js-mode fill-column-indicator change-inner visual-regexp swiper-helm elisp-slime-nav whitespace-cleanup-mode highlight-escape-sequences smart-forward encourage-mode encourange-mode fic-mode string-edit less-css-mode clojure-mode-extra-font-locking flycheck-clojure flycheck-pos-tip helm-swoop helm-ls-git org-repo-todo helm-projectile helm-ack org-redmine helm-org-rifle golden-ratio-scroll-screen chinese-font-setup diminish exec-path-from-shell guide-key flycheck move-text helm)))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-match
   ((t
     (:background "#373E4C" :foreground "#BF616A" :weight normal))))
 '(show-paren-mismatch
   ((t
     (:background "#BF616A" :foreground "#373E4C" :weight normal))))
 '(show-paren-mode t)
 '(smartscan-symbol-selector "symbol")
 '(tooltip-frame-parameters
   (quote
    ((name . "tooltip")
     (internal-border-width . 2)
     (border-width . 1)
     (no-special-glyphs . t)
     (alpha . 50))))
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-attr-value-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 2)
 '(web-mode-sql-indent-offset 2)
 '(web-mode-style-padding 0)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(winner-dont-bind-my-keys t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-jump-face-foreground ((t (:foreground "DarkSlateGray2" :inverse-video t :underline t))))
 '(aw-leading-char-face ((t (:foreground "red" :height 8.0 :width normal))))
 '(aw-mode-line-face ((t (:inherit mode-line-buffer-id :foreground "MediumPurple2" :height 1.05))))
 '(diff-added ((t (:foreground "Green"))))
 '(diff-removed ((t (:foreground "Red"))))
 '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))))
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black"))))
 '(show-paren-match ((t (:background "#373E4C" :foreground "#BF616A" :weight normal))))
 '(show-paren-mismatch ((t (:background "#BF616A" :foreground "#373E4C" :weight normal)))))
