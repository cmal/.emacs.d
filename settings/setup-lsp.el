;;; package  -- Summary:

;;; Commentary:


;;; Code:

(comment
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
   (setq lsp-prefer-flymake nil)))

(comment
 (use-package nox
   ;; :ensure t
   :defer t
   :hook
   (js-mode-hook . nox-ensure)
   (web-mode-hook . nox-ensure)
   (rjsx-mode-hook . nox-ensure)
   (python-mode-hook . nox-ensure)
   (rust-mode-hook . nox-ensure)
   (python-mode-hook . nox-ensure)
   (ruby-mode-hook . nox-ensure)
   (java-mode-hook . nox-ensure)
   (sh-mode-hook . nox-ensure)
   (php-mode-hook . nox-ensure)
   (c-mode-common-hook . nox-ensure)
   (c-mode-hook . nox-ensure)
   (csharp-mode-hook . nox-ensure)
   (c++-mode-hook . nox-ensure)
   (haskell-mode-hook . nox-ensure)
   ;; :config
   ;; (setq lsp-python-ms-auto-install-server t)
   ))

(comment
 (use-package lsp-python-ms
   :ensure t
   ))



(provide 'setup-lsp)
;;; setup-lsp.el ends here
