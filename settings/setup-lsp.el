;;; package  -- Summary:

;;; Commentary:


;;; Code:

(require 'lsp-mode)
(require 'company)
(require 'company-lsp)
(require 'lsp-ui)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; (add-hook 'python-mode-hook 'flycheck-mode)

(add-hook 'python-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'javascript-mode-hook #'lsp)
(add-hook 'typescript-mode-hook #'lsp)

(provide 'setup-lsp)
;;; setup-lsp.el ends here
