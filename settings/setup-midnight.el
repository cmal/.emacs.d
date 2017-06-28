(require 'midnight)

(midnight-delay-set 'midnight-delay "19:00pm")
;; or (midnight-delay-set 'midnight-delay 16200) ;; (eq (* 4.5 60 60) "4:30am")

(add-hook 'midnight-hook (lambda ()
                           (with-current-buffer "*unsent mail*"
                             (call-interactively 'message-send))))

(add-hook 'midnight-hook 'calendar)

;; (cancel-timer midnight-timer)
;; (setq midnight-period 7200) ;; (eq (* 2 60 60) "2 hours")

(provide 'setup-midnight)
