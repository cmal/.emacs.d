;; ;; Pre-requisites:
;; ;; rustup default nightly
;; ;; rustup component add rust-src
;; ;; cargo +nightly install racer

;; ;; Flycheck-Begin. On the fly syntax checking for multiple programming languages.
;; ;; Enable Flycheck in buffers with supported languages.
;; (use-package flycheck :ensure t)
;; (use-package flycheck-rust :ensure t)
;; (use-package rust-mode :ensure t
;;   :config
;;   (setq rust-format-on-save t))

;; (use-package racer :ensure t
;;   :config
;;   (progn
;; 	(add-hook 'rust-mode-hook #'racer-mode) ;; Activate racer in rust buffers.
;; 	(add-hook 'racer-mode-hook #'eldoc-mode) ;; Shows signature of current function in minibuffer.
;; 	;; Rust completions with Company and Racer.
;; 	(add-hook 'racer-mode-hook #'company-mode)))

;; (use-package company :ensure t
;;   :config
;;   (setq company-idle-delay 0.2)
;;   (add-hook 'racer-mode-hook
;;     (lambda ()
;;       (setq-local company-tooltip-align-annotations t))))

;; ;; Enable Cargo minor mode allows us to do cargo commands
;; ;; rust-mode and toml-mode
;; (use-package cargo :ensure t
;;   :config
;;   (progn
;;   (add-hook 'rust-mode-hook 'cargo-minor-mode)
;; 	(add-hook 'toml-mode-hook 'cargo-minor-mode)))

;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; ;; Flycheck Rust support.
;; (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;; ;; Flycheck-End.

;; ;; Path to rust source.
;; (when (equal system-type 'gnu/linux)
;;   (setq racer-rust-src-path (concat (getenv "HOME") "/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")))
;; (when (equal system-type 'darwin)
;;   (setq racer-rust-src-path (concat (getenv "HOME") "/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src")))
;; ;; Racer bin path.
;; (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))

;; ;; Map TAB key to completions.
;; (local-set-key (kbd "TAB") 'company-indent-or-complete-common)
;; (setq company-tooltip-align-annotations t)



;; https://github.com/brotzeit/rustic
;; (use-package lsp-mode)
;; (add-hook 'rust-mode-hook #'lsp)
(use-package rustic
  :ensure t
  :mode "\\.rs$"
  :config
  (rustic-mode)
  (setq rustic-lsp-server 'rust-analyzer))

(use-package cargo
  :ensure t
  :after (rustic)
  :config
  (cargo-minor-mode))


;; rust is slow, use the following:
;; ====>>>>
;; (use-package lsp-mode)

;; (use-package lsp-ui
;;   :config
;;   (setq lsp-ui-sideline-delay 0.5))

;; (use-package lsp-rust
;;   :config
;;   (require 'lsp-ui)
;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; (use-package company-lsp
;;   :config
;;   (push 'company-lsp company-backends)
;;   (setq company-lsp-enable-snippet nil))

;; (use-package rust-mode
;;   :config
;;   (add-hook 'rust-mode-hook #'lsp-rust-enable))

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package company
  :config
  (setq company-tooltip-limit 10
	company-idle-delay 0.05
	company-minimum-prefix-length 2
	company-show-numbers t
	company-tooltip-align-annotations t))

(add-hook 'rustic-mode-hook
          (lambda () (setq company-backends
                           (delete 'company-capf company-backends))))

;; <<<<====

(provide 'setup-rust)
