;; ========MIT-Scheme========

(require 'xscheme)
;; M-x run-scheme to enter

;; ========MIT-Scheme End Here========

;; ========Racket========
;; (require 'racket-mode)

(setq racket-racket-program
      (first-existing-file-in-list
       '("/usr/bin/racket" "/usr/local/bin/racket")))
(setq racket-raco-program
      (first-existing-file-in-list
       '("/usr/bin/raco" "/usr/local/bin/raco")))

;; An optional Emacs input method, racket-unicode,
;; lets you easily type various Unicode symbols that might be useful when writing Racket code.
;; To automatically enable the racket-unicode input method in racket-mode
;; and racket-repl-mode buffers, put the following code in your Emacs init file:
(add-hook 'racket-mode-hook      #'racket-unicode-input-method-enable)
(add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable)

;; racket-mode docs
;; https://github.com/greghendershott/racket-mode/blob/master/Reference.md

;; paredit-mode-hook is in clojure-mode settings
;; ========Raceket End Here========

(provide 'setup-scheme)

