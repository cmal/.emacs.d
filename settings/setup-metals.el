;; metals settings
;; https://scalameta.org/metals/docs/editors/emacs.html

(require 'lsp-java)

;; Enable scala-mode for highlighting, indentation and motion commands
(use-package scala-mode
  :ensure t
  :defer t
  :mode "\\.s\\(cala\\|bt\\)$"
  )

;; Enable sbt mode for executing sbt commands
(use-package sbt-mode
  :ensure t
  :defer t
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false"))
)

(comment
 (use-package lsp-mode
   ;; Optional - enable lsp-mode automatically in scala files
   :hook  (scala-mode . lsp)
   (lsp-mode . lsp-lens-mode)
   :config (setq lsp-prefer-flymake nil)))

;; Enable nice rendering of documentation on hover
;; (use-package lsp-ui)

;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;;   to avoid odd behavior with snippets and indentation
;; (use-package yasnippet)

;; Add company-lsp backend for metals
;; (use-package company-lsp)

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  )

(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  )

;; Use the Tree View Protocol for viewing the project structure and triggering compilation
(use-package lsp-treemacs
  :config
  (lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t)
  )

;; Enable defer and ensure by default for use-package
;; Keep auto-save/backup files separate from source code:  https://github.com/scalameta/metals/issues/1027
(comment
 (setq
;;  use-package-always-defer t
;;  use-package-always-ensure t
  backup-directory-alist `((".*" . ,temporary-file-directory))
  auto-save-file-name-transforms `((".*" ,temporary-file-directory t))))


(provide 'setup-metals)
