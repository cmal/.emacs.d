;;; package -- Summary

;; My Emacs init file
;; (setq debug-on-error t)
;;; Commentary:

;;; Code:
;; a comment macro used in .el files
(defmacro comment (&rest body)
  "Comment out one or more s-expressions.
BODY will be ignored."
  nil)

;; Turn off mouse interface early in startup to avoid momentary display

;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (when (string< emacs-version "27")
;;     (package-initialize))
(package-initialize)

;; add el-get libs before loading custom.el

;; tabbar
;;(el-get-bundle dholm/tabbar)
;;(require 'tabbar)
;;(tabbar-mode)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(defvar site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))
(let ((settings-dir (expand-file-name "settings" user-emacs-directory)))

  ;; Set up load path
  (add-to-list 'load-path settings-dir)
  (add-to-list 'load-path site-lisp-dir)
  ;; (add-to-list 'load-path org-core-dir)
  ;; (add-to-list 'load-path org-contrib-dir)

  ;; add site-lisp-dir and all of its first child dir
  ;; to 'load-path
  (defun recursively-add-dir (from to)
    (add-to-list to from)
    (dolist (f (directory-files from))
      (let ((name (concat from "/" f)))
        (when (and (not (equal f "."))
                   (not (equal f ".."))
                   (file-directory-p name))
          (add-to-list to name)))))
  (recursively-add-dir site-lisp-dir 'load-path))


;; Setup packages
(require 'setup-package)
(require 'setup-org)


;; Setup environment variables from the user's shell.
(use-package exec-path-from-shell
  :if (memq window-system '(ns x)) ;; before mac-p/gnu-p definition
  :ensure t
  :demand t
  :config (exec-path-from-shell-initialize))

(require 'my-utils)

;; add el-get libs before loading custom.el
;; (el-get-bundle dholm/tabbar)
;; (require 'tabbar)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'setup-appearance)

(require 'setup-os)

(require 'setup-keymaps)
(require 'setup-iterm2)

;; Settings for currently logged in user
(when mac-p
  (setq user-settings-dir
        (concat user-emacs-directory "users/" user-login-name))
  (when (file-exists-p user-settings-dir)
    (add-to-list 'load-path user-settings-dir)
    (require 'user-settings)))

;; Add external projects to load path
;; (dolist (project (directory-files site-lisp-dir t "\\w+"))
;;   (when (file-directory-p project)
;;     (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq-default make-backup-files t)
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))


;; Install extensions if they're missing
;; NOTE: folder `jdee-sever/` has been added for jdee to work.
(setq init-packages
      (append
       '(magit org cnfonts
               git-timemachine edn uuid dash diminish inflections spinner
               ;; golden-ratio-scroll-screen
               ;; move-text
               yasnippet emmet-mode lua-mode
               json-mode helm helm-org-rifle helm-descbinds org-redmine
               org-repo-todo helm-ack helm-ls-git helm-emmet
               visual-regexp fill-column-indicator flycheck
               flycheck-pos-tip flycheck-clojure undo-tree smartscan
               smartparens guide-key sx highlight-escape-sequences
               whitespace-cleanup-mode elisp-slime-nav rainbow-mode
               rainbow-delimiters thingatpt paredit mic-paren
               yesql-ghosts string-edit multiple-cursors fic-mode
               smart-forward wgrep change-inner web-mode js2-mode
               js2-refactor nodejs-repl restclient less-css-mode
               yaml-mode sicp graphviz-dot-mode blog-admin edit-server
               keyfreq expand-region web-server 
               adoc-mode bug-hunter helm-chrome helm-github-stars
               eredis visual-fill-column nix-mode solidity-mode
               ;; markdown-preview-mode
               ;; swbuff
               ;; swbuff-x
               ace-jump-mode pinyin-search atomic-chrome
               vue-mode editorconfig sass-mode psysh php-mode
               ;; jedi jedi-direx
               ;; python:
               ;; lsp-mode lsp-python lsp-ui helm-lsp
               rust-mode
               language-detection
               ;; w3m helm-w3m
               alert org-alert suggest
               ledger-mode hledger-mode vlf racket-mode
               exec-path-from-shell
               pangu-spacing aggressive-indent
               tree-mode geiser monokai-theme haskell-mode intero helm-ag
               paredit-menu paredit-everywhere
	       ;; jdee
	       log4j-mode log4e
               buffer-flip doom-themes
               go-mode go-dlv go-errcheck go-eldoc
               rjsx-mode ;; for jsx
               graphql-mode js-comint nvm ;; for js repl
               livereload goto-chg simple-httpd impatient-mode
               achievements plantuml-mode flycheck-plantuml
               powerthesaurus emms pact-mode elm-mode
               dart-mode flutter elisp-demos
               ace-window
               search-web ;; for xwidgets to work
               ediprolog
               tuareg utop ;; ocaml
               lsp-java scala-mode sbt-mode ;; scala
               posframe dap-mode lsp-treemacs
               ;; swiper ivy councel
               wgrep ;; write grep
               swiper-helm helm-git-grep
               xml+ ;; need by ereader
               datetime
	       ;; dice
	       define-word
               ;; describe-number ;; 显示数字代表的字符 ;; not working
               cedit
               centered-window
               chemtable ;; 元素周期表
               ;; cheat-sh ;; cannot connect
               commenter ;; 多行注释
               ;; === not used but useful ===
               ;; describe-hash
               org-roam org-roam-server
               )
       (when mac-p '(wolfram-mode
                     ;; octave-mode
                     ;; swbuff swbuff-x
		     ;; info+
		     ;; bookmark+
                     ;; org-drill
                     hyperbole
		     ;; helisp-moelp+
		     ;; help-fns+
                     ;; help-mode+
		     ;; org-wunderlist
		     ))
       (unless android-p
         '(
           ;; eval-sexp-fu
           clojure-mode
           align-cljlet
           clj-refactor cljr-helm clojure-mode-extra-font-locking
           cider
           ;; cider-eval-sexp-fu
           company company-lsp ac-cider helm-cider
           clj-refactor 4clojure helm-clojuredocs helm-cider-history
           slack))))

(defun init--install-packages ()
  (packages-install init-packages))
;; NOT USED:
;; use-package capture multi-term helm-mt
;; chinese-fonts-setup helm-projectile swiper-helm
;; smooth-scrolling auto-complete emms helm-emms
;; emms-player-mpv emms-browser emms-source-file
;; emms-source-playlist emms-lyrics emms-info e2wm el-get
;; beacon

;; ad--addoit-function

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)
(require 'setup-clipboard)

;; guide-key ;; try which-key instead
;; (require 'guide-key)
;; (setq guide-key/guide-key-sequence
;;       '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +" "C-c @" "C-c RET" "C-c" "C-x"))
;; (guide-key-mode 1)
;; (setq guide-key/recursive-key-sequence-flag t)
;; (setq guide-key/popup-window-position 'bottom)
(use-package which-key
  :ensure t
  :demand t
  :config
  (setq which-key-sort-order 'which-key-prefix-then-key-order
        ;; Let's go unicode :)
        which-key-key-replacement-alist
        '(("<\\([[:alnum:]-]+\\)>" . "\\1")
          ("up"                    . "↑")
          ("right"                 . "→")
          ("down"                  . "↓")
          ("left"                  . "←")
          ("DEL"                   . "⌫")
          ("deletechar"            . "⌦")
          ("RET"                   . "⏎"))
        which-key-description-replacement-alist
        '(("Prefix Command" . "prefix")
          ;; Lambdas
          ("\\`\\?\\?\\'"   . "λ")
          ;; Prettify hydra entry points
          ("/body\\'"       . "|=")
          ;; Drop/shorten package prefixes
          ("magit-"         . "ma-")))

  (which-key-mode)
  )

;; Setup extensions

(use-package helm
  :config
  (require 'setup-helm))

;; (eval-after-load 'ido '(require 'setup-ido))
;; (eval-after-load 'dired '(require 'setup-dired))
;; (eval-after-load 'magit '(require 'setup-magit))
;; (eval-after-load 'grep '(require 'setup-rgrep))
;; (eval-after-load 'shell '(require 'setup-shell))
;; (require 'setup-hippie)
(require 'setup-yasnippet)
;; (require 'setup-perspective)
;; (require 'setup-ffip)
;; (require 'setup-html-mode)

(use-package paredit
  :bind
  (:map paredit-mode-map
        ("M-)" . paredit-forward-slurp-sexp))
  :hook
  (prog-mode . paredit-everywhere-mode)
  :config
  (require 'paredit-everywhere)
  (require 'paredit-menu) ;; 在菜单栏显示 Paredit 项，列出所有 paredit 命令
  )

(require 'setup-company)

(use-package auto-complete
  :config
  (require 'auto-complete-config)
  (ac-config-default)
  (ac-flyspell-workaround)
  (add-to-list 'ac-dictionary-directories (concat user-emacs-directory "auto-complete/dict"))
  (setq ac-comphist-file (concat user-emacs-directory "tmp/ac-comphist.dat"))

  (global-auto-complete-mode nil)
  (setq ac-auto-show-menu t)
  (setq ac-dwim t)
  (setq ac-use-menu-map t)
  (setq ac-quick-help-delay 1)
  (setq ac-delay 0.3)
  (setq ac-quick-help-height 60)
  (setq ac-disable-inline t)
  (setq ac-show-menu-immediately-on-auto-complete t)
  (setq ac-auto-start 2)
  (setq ac-candidate-menu-min 0)

  (set-default 'ac-sources
               '(ac-source-dictionary
                 ac-source-words-in-buffer
                 ac-source-words-in-same-mode-buffers
                 ac-source-semantic
                 ac-source-yasnippet))

  (dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                                      sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                                      html-mode nxml-mode sh-mode smarty-mode clojure-mode
                                      lisp-mode textile-mode markdown-mode tuareg-mode))
    (add-to-list 'ac-modes mode))


  ;; Key triggers
  ;; (define-key ac-completing-map (kbd "C-M-n") 'ac-next)
  ;; (define-key ac-completing-map (kbd "C-M-p") 'ac-previous)
  (define-key ac-completing-map "\t" 'ac-complete)
  (define-key ac-completing-map (kbd "M-RET") 'ac-help)
  (define-key ac-completing-map "\r" 'nil)

  (add-hook 'clojure-mode-hook 'auto-complete-mode))

(unless android-p
  (require 'setup-clojure-mode)
  (require 'setup-cider)
  (require 'setup-scheme)
  ;;  (require 'setup-lsp)
  (when window-system
    (require 'setup-fonts)
    (when (display-graphic-p)
      (use-font-set-ptmono)))
  (require 'setup-dict))

(require 'setup-elisp)
(require 'setup-locale)
(require 'setup-editing)
(require 'setup-diminish)
(require 'setup-dired)
(require 'setup-gui)
(require 'setup-magit)
(require 'setup-web)
;; (require 'setup-slack)

(require 'setup-mail)
;; (require 'keylogger) ;; BUG in helm minibuffer
;; (require 'keyfreq)
;; (keyfreq-mode 1)
;; (keyfreq-autosave-mode 1)

;; (require 'prodigy)
;; (global-set-key (kbd "C-x M-m") 'prodigy)


;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
          scss-mode-hook
          restclient-mode-hook
          js-mode-hook
          js2-mode-hook
          java-mode
          ruby-mode
          ;; markdown-mode
          ;; groovy-mode
          scala-mode
          )
  (add-hook it 'turn-on-smartparens-mode))

;; Language specific setup files
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(eval-after-load 'haskell-mode '(require 'setup-haskell))

;; Load stuff on demand
(autoload 'skewer-start "setup-skewer" nil t)
(autoload 'skewer-demo "setup-skewer" nil t)

;; (require 'setup-jdee)

;;; Map files to modes
(require 'mode-mappings)

;; Highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;; Visual regexp
(require 'visual-regexp)

;; ;; Functions (load all files in defuns-dir)
;; (setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
;; (dolist (file (directory-files defuns-dir t "\\w+"))
;;   (when (file-regular-p file)
;;     (load file)))

;; (require 'expand-region)
;; (require 'delsel)
;; (require 'jump-char)
;; (require 'eproject)
;; (require 'wgrep)
;; (require 'change-inner)
;; (require 'multifiles)

;; ;; Don't use expand-region fast keys
;; (setq expand-region-fast-keys-enabled nil)

;; ;; Show expand-region command used
;; (setq er--show-expansion-message t)

;; Fill column indicator
(when mac-p (require 'fill-column-indicator))
;; (setq fci-rule-color "#111122")
(setq fci-rule-color "#ffffff")

;; ;; Browse kill ring
;; (require 'browse-kill-ring)
;; (setq browse-kill-ring-quit-action 'save-and-restore)

;; ;; Misc
;; (require 'project-archetypes)
;; (require 'my-misc)
;; (when mac-p (require 'mac))

;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; ;; Run at full power please
;; (put 'downcase-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)

;; Chrome edit server
;; (require 'edit-server)
;; (edit-server-start)

;; (atomic-chrome-start-server)
;; (setq atomic-chrome-buffer-open-style 'frame)
;; (setq atomic-chrome-extension-type-list '(atomic-chrome ghost-text))

;; M-x emms-add-netease-album RET
;; Enter ALBUM_ID RET
;; (require 'emms-netease)
;; (require 'emms-player-mpv)
;; (add-to-list 'emms-player-list 'emms-player-mpv)

;; ;; el-get
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (require 'package)
;;   (add-to-list 'package-archives
;;                '("melpa" . "http://melpa.org/packages/"))
;;   (package-refresh-contents)
;;   (package-initialize)
;;   (package-install 'el-get)
;;   (require 'el-get))
;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)


;; el-get install github packages
;; (el-get-bundle tarao/tab-group-el)
;; (require 'tab-group)

;; (el-get-bundle tkf/ne2wm)
;; (require 'ne2wm-setup)
;; (require 'ne2wm-plugin-org-clock)

;; info+ ??
;; (advice-remove 'kill-ring-save 'ad-Advice-kill-ring-save)

;; javascript indent
;; you should use set-variable for js-indent-level to 2 or 4 to switch.
(setq js-indent-level 2)
;;(set-variable 'js-indent-level 4)

(require 'move-text)


;; seq.el 25.1 remove
(defun seq-map-indexed (func sequence)
  "Return the result of applying FUNC to each element of SEQUENCE.
Unlike `seq-map', FUNC takes two arguments: the element of
the sequence, and its index within the sequence."
  (let ((index 0))
    (seq-map (lambda (elt)
               (prog1
                   (funcall func elt index)
                 (setq index (1+ index))))
             sequence)))

;; (require 'reddit)

;; (when mac-p (require 'bookmark+))

;; (require 'randomize)

(require 're-builder)
(setq reb-re-syntax 'string)

;; seems wrong
;; add info file path in Mac
;; (when mac-p
;;   (add-to-list 'Info-default-directory-list "/var/lib/dpkg/info"))

;; (require 'livereload)
;; (achievements-mode t) ;; comment due to performance problem
(use-package encourage-mode
  :demand t
  :config
  (encourage-mode)
  (require 'setup-diminish)
  (diminish 'encourage-mode))


(when mac-p
  ;; (require 'setup-pdf)
  ;; (require 'swbuff-x)
  (require 'setup-3rd-party)
  ;;(require 'setup-help)
  )

;; (dictree-write dict-english "dict-english" t)

;; (when mac-p
;;   (require 'setup-eslpod))

(flymake-mode -1)
(flymake-mode-off)

;; (use-package nix-mode)

(require 'doxygen)
;; (require 'setup-xwidgets) ;; buggy
;; (require 'setup-prolog)

(require 'setup-iterm2)
;;;  
;;;  (require 'setup-ocaml)
;;;
(comment
 (use-package nov
   :mode "\\.epub$")) ;; epub reader mode

(require 'xml)
(require 'org-ebook)
(require 'ereader)

(add-hook 'prog-mode 'eldoc-mode)


;; https://github.com/xuchunyang/marionette.el
;; https://firefox-source-docs.mozilla.org/testing/marionette/Protocol.html
;; $ /Applications/Firefox.app/Contents/MacOS/firefox -marionette
;; # For macOS (open(1) does not block your terminal)
;; $ open -a Firefox --args -marionette

;; Get Title of http://baidu.com

;; (require 'marionette)
;; (marionette-with-page
;;  (lambda (proc)
;;    (marionette-request proc 'Navigate :url "http://baidu.com")
;;    (marionette-request proc 'GetTitle)))
;; => ((value . "Example Domain"))

;; Take Screenshot of http://example.com, save to example.com.png
;; (marionette-with-page
;;  (lambda (proc)
;;    (marionette-request proc 'Navigate :url "http://baidu.com")
;;    (let-alist (marionette-request proc 'TakeScreenshot :full t)
;;      (let ((coding-system-for-write 'binary))
;;        (write-region
;;         (base64-decode-string .value)
;;         nil
;;         "baidu.com.png")))))

;;(comment
;; (use-package shell-pop
;;   ;; :ensure t
;;   :demand t
;;   :bind (("C-x p" . shell-pop))
;;   :config
;;   (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
;;   (setq shell-pop-term-shell "/bin/bash")
;;   ;; need to do this manually or not picked up by `shell-pop'
;;   (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type)))
;;
;;
;; (use-package demo-it
;;   :ensure t
;; ;;  :demand t
;;   )


;; (use-package deft
;;   :ensure t
;;   :config
;;   (setq deft-directory "~/gits/org")
;;   (setq deft-extensions '("org"))
;;   (setq deft-default-extension "org")
;;   (setq deft-text-mode 'org-mode)
;;   (setq deft-use-filename-as-title t)
;;   (setq deft-use-filter-string-for-filename t)
;;   (setq deft-auto-save-interval 0)
;;   ;;key to launch deft
;;   ;;(global-set-key (kbd "C-c d") 'deft)
;;;   )


;; if using emacs-plus built with --with-no-titlebar and see gaps
;; between your emacs frames and other windows, try this:
(setq frame-resize-pixelwise t)

(require 'setup-js)
(require 'setup-rust)

(setq pangu-spacing-include-regexp
      ;; we didn't add korean because korean-hangul-two-byte is not implemented
      (rx (or (and (or (group-n 3 (any "。，！？；：「」（）、"))
                       (group-n 1 (or (category chinse-two-byte)
                                      (category japanese-hiragana-two-byte)
                                      (category japanese-katakana-two-byte))))
                   (group-n 2 (in "a-zA-Z0-9$")))
              (and (group-n 1 (in "a-zA-Z0-9$"))
                   (or (group-n 3 (any "。，！？；：「」（）、"))
                       (group-n 2 (or (category chinse-two-byte)
                                      (category japanese-hiragana-two-byte)
                                      (category japanese-katakana-two-byte))))))))

(require 'setup-python)

(require 'annotate)
(require 'bookmark+)
