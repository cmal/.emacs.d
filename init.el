;; Turn off mouse interface early in startup to avoid momentary display

;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
;; (defun add-site-lisp-and-sub-dir ()
;;     (let ((base (expand-file-name "site-lisp" user-emacs-directory)))
;;       (add-to-list 'load-path base)
;;       (dolist (f (directory-files base))
;; 	(let ((name (concat base "/" f)))
;; 	  (when (and (file-directory-p name) 
;; 		     (not (equal f ".."))
;; 		     (not (equal f ".")))
;; 	    (add-to-list 'load-path name))))))
;; (add-site-lisp-and-sub-dir)

(require 'encourage-mode)
(encourage-mode)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'appearance)

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

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

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(magit
     git-timemachine
     edn
     uuid
     dash
     diminish
     inflections
     spinner
     move-text
;;     chinese-fonts-setup
     golden-ratio-scroll-screen
     yasnippet
     emmet-mode
     json-mode
     helm
     helm-org-rifle
     helm-descbinds
     org-redmine
     org-repo-todo
     helm-ack
     helm-projectile
     helm-ls-git
     helm-emmet
     ;; swiper-helm
     org-redmine
     visual-regexp
;;     markdown-mode
     fill-column-indicator
     flycheck
     flycheck-pos-tip
     flycheck-clojure
     ;; smooth-scrolling
     undo-tree
     smartscan
     smartparens
     guide-key
     sx
     highlight-escape-sequences
     whitespace-cleanup-mode
     elisp-slime-nav
     eval-sexp-fu
     clojure-mode
     align-cljlet
     clj-refactor
     clojure-mode-extra-font-locking
     cider
     cider-eval-sexp-fu
     ;; auto-complete
     company
     ac-cider
     helm-cider
     clj-refactor
     4clojure
     rainbow-delimiters
     thingatpt
     paredit
     mic-paren
     yesql-ghosts
     string-edit
     ledger-mode
     multiple-cursors
     fic-mode
     smart-forward
     wgrep
     change-inner
     ;; web dev
     web-mode
     js2-mode
     js2-refactor
     nodejs-repl
     restclient
     less-css-mode
     yaml-mode
     ;; learn
     sicp
     ;; drawing
     graphviz-dot-mode
     ;; blog, need hexo, hexo-renderer-org
     blog-admin
     edit-server
     keyfreq
     expand-region
;;     use-package
     markdown-preview-mode
     )))

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
      '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +" "C-c @"))
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
;; (require 'setup-yasnippet)
;; (require 'setup-perspective)
;; (require 'setup-ffip)
;; (require 'setup-html-mode)
(require 'setup-paredit)
;; (require 'setup-auto-complete)
(require 'setup-company)
(require 'setup-clojure-mode)
(require 'setup-cider)


(require 'setup-fonts)
(require 'setup-sdcv)
(require 'setup-locale)
(require 'setup-editing)
(require 'setup-diminish)
(require 'setup-keymaps)

(require 'keylogger)
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;; (require 'prodigy)
;; (global-set-key (kbd "C-x M-m") 'prodigy)

;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          js2-mode-hook
          java-mode
          ruby-mode
;;          markdown-mode
          groovy-mode
          scala-mode)
  (add-hook it 'turn-on-smartparens-mode))

;; Language specific setup files
;; (eval-after-load 'js2-mode '(require 'setup-js2-mode))
;; (eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))

;; Load stuff on demand
(autoload 'skewer-start "setup-skewer" nil t)
(autoload 'skewer-demo "setup-skewer" nil t)
;; (autoload 'auto-complete-mode "auto-complete" nil t)
(eval-after-load 'flycheck '(require 'setup-flycheck))

;; Map files to modes
(require 'mode-mappings)


;; Highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;; Visual regexp
(require 'visual-regexp)
(define-key global-map (kbd "M-&") 'vr/query-replace)
;; (define-key global-map (kbd "M-/") 'vr/replace)

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
(require 'fill-column-indicator)
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
(require 'edit-server)
(edit-server-start)
(put 'narrow-to-region 'disabled nil)

(require 'move-text)

;; blog-admin
(require 'blog-admin)
(setq blog-admin-backend-path "~/gits/learning_clojure")
(setq blog-admin-backend-type 'hexo)
(setq blog-admin-backend-new-post-in-drafts nil)
(setq blog-admin-backend-new-post-with-same-name-dir nil)
(setq blog-admin-backend-hexo-config-file "_config.yml")
(add-hook 'blog-admin-backend-after-new-post-hook 'find-file)


