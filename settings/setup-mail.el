;; need setting ~/.authinfo
;; machine smtp.xxx.com port 25 login yourusername password yourpassword
;; then set smtpmail-smtp-user to yourusername
;; and change other settings

(define-mail-alias "yuzhao" "yu.zhao@joudou.com")
(define-mail-alias "dc" "develop-dc@joudou.com")

(setq smtpmail-smtp-server "smtp.mxhichina.com")

(setq smtpmail-smtp-service 25)
(setq user-full-name "Yu Zhao 赵宇")
(setq user-mail-address "yu.zhao@joudou.com")
(setq smtpmail-smtp-user "yu.zhao@joudou.com")

;; use my-org-screenshot in setup-org.el to capture screen

;; key shortcuts
(defun message-mode-custom-keys-config ()
  (local-set-key (kbd "C-c x") 'mail-add-attachment))

(add-hook 'message-mode-hook 'message-mode-custom-keys-config)

(provide 'setup-mail)
