;; used customize markdown-mode from https://github.com/michaelamie/markdown-mode-css
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; need pygmentize ?
;; use pip install markdown to install necessary package
(setq markdown-command "python -m markdown -x markdown.extensions.extra -x markdown.extensions.codehilite -x markdown.extensions.headerid -x markdown.extensions.meta -x markdown.extensions.nl2br -x markdown.extensions.sane_lists -x markdown.extensions.smarty -x markdown.extensions.toc -x markdown.extensions.wikilinks")
(setq markdown-css-dir "~/.emacs.d/markdown-css/")
(setq markdown-css-theme "solarized-light")

;; use M-x markdown-preview to show with markdown-css themes
;; but without syntax highlight

;; use:
;; M-x markdown-preview-mode
;; M-x markdown-preview-open-browser
;; to privew markdown with syntax highlight

;; TeX MathJax
;; (add-to-list 'markdown-preview-javascript '("http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML" . async))


;; markdown-preview codehilite list
;; http://richleland.github.io/pygments-css/
(setq markdown-code-highlight-style "https://rawgit.com/richleland/pygments-css/master/zenburn.css")

(setq markdown-imenu-generic-expression
      '(("title"  "^\\(.*\\)[\n]=+$" 1)
        ("h2-"    "^\\(.*\\)[\n]-+$" 1)
        ("h1"   "^# \\(.*\\)$" 1)
        ("h2"   "^## \\(.*\\)$" 1)
        ("h3"   "^### \\(.*\\)$" 1)
        ("h4"   "^#### \\(.*\\)$" 1)
        ("h5"   "^##### \\(.*\\)$" 1)
        ("h6"   "^###### \\(.*\\)$" 1)
        ("fn"   "^\\[\\^\\(.*\\)\\]" 1)
        ))

(add-hook 'markdown-mode-hook
          (lambda ()
            (setq imenu-generic-expression markdown-imenu-generic-expression)))

(provide 'setup-markdown-mode)
