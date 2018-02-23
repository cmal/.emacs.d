;; setup-slack
(require 'slack)

(setq slack-buffer-emojify nil)

(setq slack-prefer-current-team t)

(comment
 (slack-register-team
  :name "emacs-slack"
  :default t
  :client-id "aaaaaaaaaaa.00000000000"
  :client-secret "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
  :token "aaaa-sssssssssss-88888888888-hhhhhhhhhhh-jjjjjjjjjj"
  :subscribed-channels '(test-rename rrrrr)
  :full-and-display-names t
  ))

(provide 'setup-slack)
