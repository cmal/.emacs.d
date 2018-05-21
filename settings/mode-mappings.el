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
(add-to-list 'auto-mode-alist '("\\.wxss$" . css-mode))
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
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
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
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-mode))
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

;; Scala
;; (autoload 'scala-mode "scala-mode2")
;; (add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
;; (autoload 'ensime-scala-mode-hook "ensime")
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; Clojure
(autoload 'clojure-mode "clojure-mode")
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("\\.cljc$" . clojurec-mode))
(add-hook 'clojure-mode-hook 'hs-minor-mode)
(add-hook 'clojurescript-mode-hook 'hs-minor-mode)

(add-to-list 'auto-mode-alist '("\\.asciidoc$" . adoc-mode))
;; (add-hook 'adoc-mode-hook 'cider-mode) ;; added in setup-cider.el

;; SVG
(add-to-list 'auto-mode-alist '("\\.svg$" . image-mode))

;; JavaScript
(autoload 'js2-mode "js2-mode" nil t)
(autoload 'javascript-mode "javascript-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . javascript-mode))
(add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))

;; Configuration files
(add-to-list 'auto-mode-alist '("\\.offlineimaprc$" . conf-mode))

;; Snippets
;; (add-to-list 'auto-mode-alist '("yasnippet/snippets" . snippet-mode))
;; (add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; Buster.JS
                                        ;(autoload 'buster-mode "buster-mode")
                                        ;(setq buster-node-executable "/usr/local/bin/node")
                                        ;(add-file-find-hook-with-pattern "test\\.js$" (lambda () (buster-mode)) "require(\\(\"\\|'\\)buster")

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Apache config
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; ledger mode
(autoload 'ledger-mode "ledger-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

;; php mode
(setq auto-mode-alist
      (append '(("\\.php$" . php-mode)) auto-mode-alist))

;; python mode
(setq auto-mode-alist
      (append '(("\\.py$" . python-mode)) auto-mode-alist))

;; ledger mode
(autoload 'ledger-mode "ledger-mode" "A major mode for Ledger" t)
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

;; wolfram mode
(autoload 'wolfram-mode "wolfram-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.wl$" . wolfram-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode))

;; haskell mode
(autoload 'haskell-mode "haskell-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'haskell-mode-hook 'smartparens-mode)

;; conf mode
(autoload 'conf-mode "conf-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.conf$" . conf-mode))

;; csharp mode
(autoload 'csharp-mode "csharp-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))
(add-hook 'csharp-mode-hook 'smartparens-mode)

;; Lisp modes
(dolist (x '(scheme emacs-lisp lisp racket clojure))
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'enable-paredit-mode)
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-delimiters-mode)
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'subword-mode)
  ;; (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'aggressive-indent-mode)
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'electric-indent-mode)
  )

;; remove temporary due to performance problem
;; (remove-hook 'clojure-mode-hook 'aggressive-indent-mode)

;; vue mode
(autoload 'vue-mode "vue-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vue$" . vue-mode))


;; go mode
(autoload 'go-mode "go-mode" nil t)
(define-key go-mode-map (kbd "C-c C-c") 'godoc-at-point)

;; makefile-bsdmake-mode
(add-hook 'makefile-bsdmake-mode 'whitespace-mode)

(provide 'mode-mappings)
