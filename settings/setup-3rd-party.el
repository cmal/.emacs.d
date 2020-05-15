(require 'taskwarrior)

;; after brew install dunn/emacs/djvu-emacs on mac
;; (when mac-p
;;  (require 'djvu))

(use-package plantuml-mode
  :demand t
  :config
  (setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2020.0/libexec/plantuml.jar")
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))

;; blog-admin
;; (require 'blog-admin)
;; (setq blog-admin-backend-path (expand-file-name "~/gits/learning_clojure"))
;; (setq blog-admin-backend-type 'hexo)
;; (setq blog-admin-backend-new-post-in-drafts nil)
;; (setq blog-admin-backend-new-post-with-same-name-dir nil)
;; (setq blog-admin-backend-hexo-config-file "_config.yml")
;; (add-hook 'blog-admin-backend-after-new-post-hook 'find-file)


(provide 'setup-3rd-party)
