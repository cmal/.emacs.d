;; Are we on a mac?
(defvar mac-p (equal system-type 'darwin))
;; Are we on a GNU/Linux?
(defvar gnu-p
      (when (string-match-p
             ".*GNU.*"
             (shell-command-to-string "uname -a"))
        t))
;; Are we on an Android?
(defvar android-p
      (when (string-match-p
             ".*Android.*"
             (shell-command-to-string "uname -a"))
        t))
;; Are we on a Windows?
(defvar win-p
      (equal system-type 'windows-nt))

(provide 'setup-os)
