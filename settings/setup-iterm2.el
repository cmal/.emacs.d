;; (defun iterm2/global-set-key (key command &optional prefix suffix)
;;   "`iterm/map-key' KEY then `global-set-key' KEY with COMMAND.
;;  PREFIX or SUFFIX can wrap the key when passing to `global-set-key'."
;;   (iterm2/map-key key)
;;   (global-set-key (kbd (concat prefix key suffix)) command))

;; (defun iterm2/map-key (key)
;;   "Map KEY from escape sequence \"\e[emacs-KEY\."
;;   (message key)
;;   (define-key function-key-map (concat "\e[emacs-" key) (kbd key)))

;; (iterm2/global-set-key "C-'" 'ort/capture-todo)
;; (iterm2/global-set-key "C-`" 'ort/goto-todos)

;; (defun iterm2/wrap-keys (orig-fun &rest args)
;;   (iterm2/map-key (key-description (car args)))
;;   (apply orig-fun args))

;; makes global-set-key defines iterm2 compatible kbds
;; needs to define those keys in iterm2 preferences
;; (advice-add 'global-set-key :around #'iterm2/wrap-keys)

;;; makes shell commands work
(exec-path-from-shell-initialize)


;; enable mouse selection
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)



(provide 'setup-iterm2)
