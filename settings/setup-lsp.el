;;; package  -- Summary:

;;; Commentary:


;;; Code:

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :ensure t
  :defer t

  :hook
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  ;; (lsp-mode . lsp-ui-mode)
  ;; (python-mode 'flycheck-mode)
  (python-mode . lsp)
  (rust-mode . lsp)
  (js-mode . lsp)
  (js2-mode . lsp)
  (typescript-mode . lsp)

  :config
  (require 'company)
  (require 'company-lsp)
  (require 'lsp-ui)
  (require 'helm-lsp)
  (setq lsp-prefer-flymake nil))


(provide 'setup-lsp)
;;; setup-lsp.el ends here
