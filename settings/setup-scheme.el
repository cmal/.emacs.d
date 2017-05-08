;; ========MIT-Scheme========





;; ========MIT-Scheme End Here========

;; ========Racket========
;; (require 'racket-mode)

(setq racket-racket-program "/Applications/Racket v6.9/bin/racket")
(setq racket-raco-program   "/Applications/Racket v6.9/bin/raco")

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
