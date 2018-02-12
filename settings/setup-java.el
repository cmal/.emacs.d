(autoload 'jdee-mode "jde" "JDE mode" t)
(setq auto-mode-alist
      (append '(("\\.java\\'" . jdee-mode)) auto-mode-alist))
(custom-set-variables
 '(jdee-server-dir "/Users/yuzhao/.emacs.d/jdee-server"))
(require 'jdee)
(provide 'setup-java)
