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


;; ==========
;; send mail at specific time
(require 'midnight)
(midnight-delay-set 'midnight-delay "19:00pm")
;; or (midnight-delay-set 'midnight-delay 16200) ;; (eq (* 4.5 60 60) "4:30am")
(add-hook 'midnight-hook (lambda ()
                           (with-current-buffer "*unsent mail*"
                             (call-interactively 'message-send))))
(add-hook 'midnight-hook 'calendar)
;; (cancel-timer midnight-timer)
;; (setq midnight-period 7200) ;; (eq (* 2 60 60) "2 hours")
;; ==========


(defun send-month-check-mail-at-some-time ()
  (interactive)
  (run-at-time
   (encode-time 59 21 14 30 6 2017) ;; TODO should change this to month end
   nil
   (lambda ()
     (with-current-buffer "*monthcheck mail*"
       (call-interactively 'message-send)))))

(provide 'setup-mail)
