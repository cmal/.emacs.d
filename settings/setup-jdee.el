(autoload 'jdee-mode "jde" "JDE mode" t)
(setq auto-mode-alist
      (append '(("\\.java\\'" . jdee-mode)) auto-mode-alist))
(custom-set-variables
 '(jdee-server-dir "~/.emacs.d/jdee-server"))

;; only for thinking-in-java
(setq mindview-jar
      "/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home/lib/net.jar")

(custom-set-variables
 '(jdee-compile-option-command-line-args
   `("-classpath"
     ,mindview-jar)))

(custom-set-variables
 '(jdee-run-option-classpath
   `(,mindview-jar ".")))

(add-hook
 'jdee-mode-hook
 '(lambda ()
    (local-set-key (kbd "RET") 'newline-and-indent)))

(require 'jdee)


;; Javadoc Help
;; (autoload 'javadoc-lookup       "javadoc-help" "Look up Java class in Javadoc."   t)
;; (autoload 'javadoc-help         "javadoc-help" "Open up the Javadoc-help menu."   t)
;; (autoload 'javadoc-set-predefined-urls  "javadoc-help" "Set pre-defined urls."    t)
;; (global-set-key [f8] 'javadoc-lookup)
;; (global-set-key [(shift f8)] 'javadoc-help)

(provide 'setup-java)
