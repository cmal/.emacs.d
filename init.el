;; init.el

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

;; Turn off mouse interface early in startup to avoid momentary display

;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
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
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; add site-lisp-dir and all of its first child dir
;; to 'load-path
(defun add-site-lisp-and-sub-dir ()
  (let ((base (expand-file-name "site-lisp" user-emacs-directory)))
    (add-to-list 'load-path base)
    (dolist (f (directory-files base))
      (let ((name (concat base "/" f)))
        (when (and (file-directory-p name) 
                   (not (equal f ".."))
                   (not (equal f ".")))
          (add-to-list 'load-path name))))))
(add-site-lisp-and-sub-dir)

(require 'encourage-mode)
(encourage-mode)

;; add el-get libs before loading custom.el
;; (el-get-bundle dholm/tabbar)
;; (require 'tabbar)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'appearance)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))
;; Are we on a GNU/Linux?
(setq is-gnu
      (when (string-match-p
             ".*GNU.*"
             (shell-command-to-string "uname -a"))
        t))
;; Are we on an Android?
(setq is-android
      (when (string-match-p
             ".*Android.*"
             (shell-command-to-string "uname -a"))
        t))
;; Are we on a Windows?
(setq is-windows
      (equal system-type 'windows-nt))

;; Settings for currently logged in user
(when is-mac
  (progn
    (setq user-settings-dir
          (concat user-emacs-directory "users/" user-login-name))
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


;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
;; NOTE: folder `jdee-sever/` has been added for jdee to work.
(defun init--install-packages ()
  (packages-install
   (append
    '(magit
      git-timemachine edn uuid dash diminish inflections spinner
      move-text golden-ratio-scroll-screen yasnippet emmet-mode
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
      keyfreq expand-region web-server markdown-preview-mode
      adoc-mode bug-hunter helm-chrome helm-github-stars
      eredis
      ;;swbuff
      ;;swbuff-x
      ace-jump-mode pinyin-search atomic-chrome
      vue-mode editorconfig sass-mode psysh php-mode jedi
      jedi-direx
      language-detection
      ;; w3m helm-w3m
      alert org-alert suggest
      ledger-mode hledger-mode vlf racket-mode
      exec-path-from-shell
      pangu-spacing aggressive-indent
      tree-mode geiser monokai-theme haskell-mode intero helm-ag
      paredit-menu paredit-everywhere jdee log4j-mode log4e
      buffer-flip
      go-mode go-dlv go-errcheck go-eldoc
      )
    (when is-mac '(wolfram-mode
		   swbuff swbuff-x info+ bookmark+
		   hyperbole help+ help-fns+
		   help-mode+ org-wunderlist))
    (when (not is-android)
      '(eval-sexp-fu
        clojure-mode align-cljlet
        clj-refactor cljr-helm clojure-mode-extra-font-locking
        cider cider-eval-sexp-fu company ac-cider helm-cider
        clj-refactor 4clojure helm-clojuredocs helm-cider-history
        slack)))))
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

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence
      '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +" "C-c @" "C-c RET"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; Setup extensions

(require 'helm)
(eval-after-load 'helm '(require 'setup-helm))
;; (eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'org '(require 'setup-org))
;; (eval-after-load 'dired '(require 'setup-dired))
;; (eval-after-load 'magit '(require 'setup-magit))
;; (eval-after-load 'grep '(require 'setup-rgrep))
;; (eval-after-load 'shell '(require 'setup-shell))
;; (require 'setup-hippie)
(require 'setup-yasnippet)
;; (require 'setup-perspective)
;; (require 'setup-ffip)
;; (require 'setup-html-mode)
(require 'setup-paredit)
;; (require 'setup-auto-complete)
(require 'setup-company)

(when (not is-android)
  (require 'setup-clojure-mode)
  (require 'setup-cider)
  (require 'setup-python)
  (require 'setup-scheme))
(require 'setup-elisp)

(when (not is-android)
  (require 'setup-fonts)
  (require 'setup-sdcv))

(require 'setup-locale)
(require 'setup-editing)
(require 'setup-diminish)
(require 'setup-dired)
(require 'setup-gui)
(require 'setup-magit)
(require 'setup-web)
(when is-mac (require 'setup-help))
;; (require 'setup-slack)

(require 'setup-mail)
;; (require 'keylogger) ;; BUG in helm minibuffer
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;; (require 'prodigy)
;; (global-set-key (kbd "C-x M-m") 'prodigy)

;; after require setup-font
(if (display-graphic-p)
    (progn
      ;; (use-font-set-inziu)
      ;; (use-font-set-ptmono)
      ;; (use-font-iosevka-slab)
      ;; (use-font-set-pragmata)
      (use-font-mononoki)
      ))

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
          ;; scala-mode
          )
  (add-hook it 'turn-on-smartparens-mode))

;; Language specific setup files
;; (eval-after-load 'js2-mode '(require 'setup-js2-mode))
;; (eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(when is-mac
  (eval-after-load 'markdown-mode '(require 'setup-markdown-mode)))
(eval-after-load 'js-mode '(require 'setup-js-mode))

;; Load stuff on demand
(autoload 'skewer-start "setup-skewer" nil t)
(autoload 'skewer-demo "setup-skewer" nil t)
;; (autoload 'auto-complete-mode "auto-complete" nil t)
(eval-after-load 'flycheck '(require 'setup-flycheck))

(require 'setup-java)

;; Map files to modes
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
(when is-mac (require 'fill-column-indicator))
;; (setq fci-rule-color "#111122")
(setq fci-rule-color "#ffffff")

;; ;; Browse kill ring
;; (require 'browse-kill-ring)
;; (setq browse-kill-ring-quit-action 'save-and-restore)

;; ;; Smart M-x is smart
;; ;; (require 'smex)
;; ;; (smex-initialize)

;; ;; Setup key bindings
;; ;; (require 'key-bindings)

;; ;; Misc
;; (require 'project-archetypes)
;; (require 'my-misc)
;; (when is-mac (require 'mac))

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

(require 'my-utils)

;; blog-admin
(require 'blog-admin)
(setq blog-admin-backend-path "~/gits/learning_clojure")
(setq blog-admin-backend-type 'hexo)
(setq blog-admin-backend-new-post-in-drafts nil)
(setq blog-admin-backend-new-post-with-same-name-dir nil)
(setq blog-admin-backend-hexo-config-file "_config.yml")
(add-hook 'blog-admin-backend-after-new-post-hook 'find-file)


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

(when is-mac (require 'swbuff-x))

(when is-mac
  (require 'wolfram-mode)
  (autoload 'wolfram-mode "wolfram-mode" nil t)
  (autoload 'run-wolfram "wolfram-mode" nil t)
  (setq wolfram-program "/Applications/Mathematica.app/Contents/MacOS/MathKernel")
  (add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode)))

(setq debug-on-error t)

;; info+ ??
(advice-remove 'kill-ring-save 'ad-Advice-kill-ring-save)

;; javascript indent
;; you should use set-variable for js-indent-level to 2 or 4 to switch.
(setq js-indent-level 2)
;;(set-variable 'js-indent-level 4)

(require 'move-text)

(require 'setup-keymaps)
(require 'setup-pdf)

;; seq.el 25.1 remove
(defun seq-map-indexed (function sequence)
  "Return the result of applying FUNCTION to each element of SEQUENCE.
Unlike `seq-map', FUNCTION takes two arguments: the element of
the sequence, and its index within the sequence."
  (let ((index 0))
    (seq-map (lambda (elt)
               (prog1
                   (funcall function elt index)
                 (setq index (1+ index))))
             sequence)))

(require 'reddit)

(when is-mac (require 'bookmark+))

;; (require 'randomize)

(require 're-builder)
(setq reb-re-syntax 'string)

;; add info file path in Mac
(add-to-list 'Info-default-directory-list "/var/lib/dpkg/info")


(require 'leetcode)
