(require 'prolog)

(require 'ediprolog)
(global-set-key [f10] 'ediprolog-dwim)


(autoload 'run-prolog "prolog"
  "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog"
  "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog"
  "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(add-to-list 'auto-mode-alist
             '(("\\.pl$" . prolog-mode)
               ;; because Wolfram also uses .m extension
               ;;("\\.m$" . mercury-mode)
               ))

;; https://stackoverflow.com/questions/28467011/what-are-the-main-technical-differences-between-prolog-and-minikanren-with-resp

(provide 'setup-prolog)
