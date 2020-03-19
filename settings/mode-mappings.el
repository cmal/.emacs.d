(require 'rainbow-mode)
;; YAML
(autoload 'yaml-mode "yaml-mode")
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("jsTestDriver\\.conf$" . yaml-mode))

;; Emacs lisp
(add-to-list 'auto-mode-alist '("Carton$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("Cask$" . emacs-lisp-mode))

;; Emmet mode
(autoload 'emmet-mode "emmet-mode")

;; CSS
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))

(add-hook 'css-mode-hook (lambda() (rainbow-mode)))
(add-hook 'css-mode-hook (lambda() (emmet-mode)))

(add-hook 'scss-mode-hook (lambda () (rainbow-mode)))
(add-hook 'scss-mode-hook (lambda () (emmet-mode)))
(add-hook 'scss-mode-hook (lambda () (rainbow-delimiters-mode)))
(add-hook 'scss-mode-hook (lambda () (subword-mode)))
(add-to-list 'rainbow-html-colors-major-mode-list 'scss-mode)

;;(add-hook 'scss-mode-hook (lambda () (aggressive-indent-mode)))
(add-hook 'less-css-mode-hook (lambda() (rainbow-mode)))
(add-hook 'less-css-mode-hook (lambda() (emmet-mode)))
(add-to-list 'rainbow-html-colors-major-mode-list 'less-css-mode)

;; Restclient
(add-to-list 'auto-mode-alist '("\\.restclient$" . restclient-mode))

;; ;; Cucumber
;; (autoload 'feature-mode "feature-mode")
;; (add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;; ;; Adventur
;; (autoload 'adventur-mode "adventur-mode")
;; (add-to-list 'auto-mode-alist '("\\.adv$" . adventur-mode))

;; Jade and Stylus (sws = significant whitespace)
;; (autoload 'sws-mode "sws-mode")
;; (autoload 'jade-mode "jade-mode")
;; ;; (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;; (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; HTML
(autoload 'web-mode "web-mode")
;; (add-to-list 'auto-mode-alist '("\\.html\\'" . crappy-jsp-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tag$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vm$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))

;; JSP
;; (autoload 'crappy-jsp-mode "crappy-jsp-mode")
;; (add-to-list 'auto-mode-alist '("\\.jsp$" . crappy-jsp-mode))
;; (add-to-list 'auto-mode-alist '("\\.jspf$" . crappy-jsp-mode))
;;(add-to-list 'auto-mode-alist '("\\.js$'" . js2-mode))

;;Support for JSX is available via the derived mode `js2-jsx-mode'.  If you
;;also want JSX support, use that mode instead:
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))


;; Ruby
(autoload 'rhtml-mode "rhtml-mode")
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.watchr$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

;; ;; Puppet
;; (autoload 'puppet-mode "puppet-mode")
;; (add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; ;; Groovy
;; (autoload 'groovy-mode "groovy-mode")
;; (add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))
;; (add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))

;; Clojure
(use-package clojure-mode
  :mode (("\\.clj[xc]?" . clojure-mode)
         ("\\.cljs" . clojurescript-mode))
  :hook
  (clojure-mode . hs-minor-mode))

(use-package adoc-mode
  :mode ("\\.asciidoc$" . adoc-mode))


;; SVG
(add-to-list 'auto-mode-alist '("\\.svg$" . image-mode))

;; JavaScript
(autoload 'js2-mode "js2-mode" nil t)
(autoload 'javascript-mode "javascript-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))
;;(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . javascript-mode))
(add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))

;; Java
(add-to-list 'auto-mode-alist '("\\.java$" . java-mode))

;; Configuration files
(add-to-list 'auto-mode-alist '("\\.offlineimaprc$" . conf-mode))

;; Snippets
;; (add-to-list 'auto-mode-alist '("yasnippet/snippets" . snippet-mode))
;; (add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook 'auto-fill-mode)

;; ;; Apache config
;; (autoload 'apache-mode "apache-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
;; (add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
;; (add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
;; (add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
;; (add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; ledger mode
(use-package ledger-mode
  :mode "\\.ledger$")

;; php mode
(setq auto-mode-alist
      (append '(("\\.php$" . php-mode)) auto-mode-alist))

;; python mode
(setq auto-mode-alist
      (append '(("\\.py$" . python-mode)) auto-mode-alist))

;; wolfram mode
(autoload 'wolfram-mode "wolfram-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.wl$" . wolfram-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode))

;; haskell mode
(autoload 'haskell-mode "haskell-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
;; (add-hook 'haskell-mode-hook 'intero-mode-whitelist)
(add-hook 'haskell-mode-hook 'smartparens-mode)

(defun setup-structured-haskell-mode ()
  (setq exec-path (append exec-path '("~/.cabal/bin" "~/.local/bin")))
  (add-to-list 'load-path "/Users/yuzhao/gits/structured-haskell-mode/elisp")
  (require 'shm)
  (add-hook 'haskell-mode-hook (lambda ()
                                 (structured-haskell-mode)
                                 (setq haskell-indentation-mode nil)
                                 (flycheck-mode))))
(setup-structured-haskell-mode)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;; ;; haskell mode browsing haddocks
;; ;; http://haskell.github.io/haskell-mode/manual/latest/Browsing-Haddocks.html#Browsing-Haddocks
;; (add-hook 'haskell-mode-hook
;;           (lambda ()
;;             (require 'w3m-haddock)
;;             (add-hook 'w3m-display-hook 'w3m-haddock-display)
;;             (define-key haskell-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)))

;; hoogle
(add-hook 'haskell-mode-hook
          (lambda ()
            (define-key haskell-mode-map "\C-ch" 'haskell-hoogle)
            (setq haskell-hoogle-command "hoogle")))

;; conf mode
(autoload 'conf-mode "conf-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.conf$" . conf-mode))

;; csharp mode
(autoload 'csharp-mode "csharp-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))
(add-hook 'csharp-mode-hook 'smartparens-mode)

;; Lisp modes
(dolist (x '(scheme emacs-lisp lisp racket clojure))
  (when-let (hook (intern-soft (concat (symbol-name x) "-mode-hook")))
    (add-hook hook 'enable-paredit-mode)
    ;; (add-hook hook 'rainbow-delimiters-mode)
    (add-hook hook 'subword-mode)
    ;; (add-hook hook 'aggressive-indent-mode) ;; use electric-indent-mode by default
    (add-hook hook 'electric-indent-mode)))

(dolist (x '(emacs-lisp lisp clojure))
  (when-let (kmap (symbol-value (intern-soft (concat (symbol-name x) "-mode-map"))))
   (define-key kmap (kbd "<C-M-backspace>") 'backward-kill-sexp)))

;; remove temporary due to performance problem
;; (remove-hook 'clojure-mode-hook 'aggressive-indent-mode)

;; vue mode
(use-package vue-mode
  :mode "\\.vue$")


;; go mode
(use-package go-mode
  :mode "\\.go$"
  :bind
  (:map go-mode-map
        ("C-c C-c" 'godoc-at-point)))


;; makefile-bsdmake-mode
(add-hook 'makefile-bsdmake-mode 'whitespace-mode)

;; wechat miniprogram
(add-to-list 'auto-mode-alist '("\\.wxss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.wxml$" . web-mode))

;; Info-mode : NOTE this is for `info+', not the default
;; info-mode-hook
;; (add-hook 'Info-mode-hook 'rainbow-delimiters-mode)

(autoload 'apples-mode "apples-mode" nil t)

(autoload 'nix-mode "nix-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.nix$" . nix-mode))

(autoload 'solidity-mode "solidity-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.sol$" . solidity-mode))

(autoload 'racket-mode "racket-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rkt$" . racket-mode))
;; (add-to-list 'auto-mode-alist '("\\.scm$" . racket-mode))

(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))

;; elm-mode
(autoload 'elm-mode "elm-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.elm$" . elm-mode))

;; shell-script-mode
(autoload 'shell-script-mode "shell-script-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.sh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.sh.ftpl$" . shell-script-mode))

;; prolog-mode
;; in setup-prolog.el

(provide 'mode-mappings)
