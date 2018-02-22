(autoload 'jdee-mode "jde" "JDE mode" t)
(setq auto-mode-alist
      (append '(("\\.java\\'" . jdee-mode)) auto-mode-alist))
(custom-set-variables
 '(jdee-server-dir "/Users/yuzhao/.emacs.d/jdee-server"))

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
(provide 'setup-java)