;; terminal
(unless window-system

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
  ;; (exec-path-from-shell-initialize) ;; already did this in init.el


  ;; enable mouse selection
  ;; (require 'mouse)
  (xterm-mouse-mode t)
  ;; (defun track-mouse (e))
  ;; (setq mouse-sel-mode t)
  (global-set-key [mouse-4] 'scroll-down-line)
  (global-set-key [mouse-5] 'scroll-up-line))


;; gui + terminal

(defun send-region-to-iterm2 (start end)
  "Send the text of the current region to iTerm2."
  (interactive "r")
  (let ((python (expand-file-name "~/Library/ApplicationSupport/iTerm2/iterm2env/versions/3.7.5/bin/python"))
        (script (expand-file-name "~/Library/ApplicationSupport/iTerm2/Scripts/iterm2.py")))
    (call-process-region start end python nil nil nil script)))

(provide 'setup-iterm2)
  
