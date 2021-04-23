;; (use-package lsp-ui
;;   :ensure t
;;   :demand t)

(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp)))
  :init
  (setq lsp-python-ms-executable
        "/Users/yuzhao/py3btgym/bin/pyls")
  :config
  (setq company-mode nil)
  )

(add-hook 'python-mode-hook (lambda ()
                              (setq company-mode nil)
                              (setq python-indent-offset 4)))

(comment
 (use-package lsp-mode
   :ensure t
   :config

   ;; make sure we have lsp-imenu everywhere we have LSP
   (require 'lsp-ui)
   (require 'lsp-ui-imenu)
   (add-hook 'lsp-after-open-hook 'lsp-ui-enable-imenu)  
   ;; get lsp-python-enable defined
   ;; NB: use either projectile-project-root or ffip-get-project-root-directory
   ;;     or any other function that can be used to find the root directory of a project
   (when mac-p

     ;; (setq lsp-python-ms-executable "/Users/yuzhao/py3btgym/bin/pyls")
     ;; (setq lsp-pyls-server-command "/Users/yuzhao/py3btgym/bin/pyls")
     (setq lsp-python-ms-executable "/Users/yuzhao/py3tf2.3/bin/pyls")
     (setq lsp-pyls-server-command "/Users/yuzhao/py3tf2.3/bin/pyls")
     )
   (comment
    (lsp-define-stdio-client lsp-python "python"
                             #'projectile-project-root
                             '("pyls")))

   ;; make sure this is activated when python-mode is activated
   ;; lsp-python-enable is created by macro above 
   (add-hook 'python-mode-hook
             (lambda ()
               (lsp)))

   ;; lsp extras
   (use-package lsp-ui
     :ensure t
     :config
     (setq lsp-ui-sideline-ignore-duplicate t)
     (add-hook 'lsp-mode-hook 'lsp-ui-mode))

   (comment
    (use-package company-lsp
      :config
      (push 'company-lsp company-backends)))

   ;; NB: only required if you prefer flake8 instead of the default
   ;; send pyls config via lsp-after-initialize-hook -- harmless for
   ;; other servers due to pyls key, but would prefer only sending this
   ;; when pyls gets initialised (:initialize function in
   ;; lsp-define-stdio-client is invoked too early (before server
   ;; start)) -- cpbotha
   (defun lsp-set-cfg ()
     (let ((lsp-cfg `(:pyls (:configurationSources ("flake8")))))
       ;; TODO: check lsp--cur-workspace here to decide per server / project
       (lsp--set-configuration lsp-cfg)))

   (add-hook 'lsp-after-initialize-hook 'lsp-set-cfg)))

;; (setq lsp-mode-hook nil)
;; (setq lsp-after-initialize-hook nil)
;; (setq company-mode nil)

(defun py-insert-print (var)
  "Add console.log of `var' to point."
  (interactive "s请输入要打印的变量名: ")
  (insert (format "print('#### %s: ', %s)" var var))
  )

(use-package python-mode
  :init (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  :bind
  (:map python-mode-map
        ("C-c C-c" . py-insert-print)))


(provide 'setup-python)

