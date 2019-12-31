(require 'flycheck)
(require 'flycheck-pos-tip)

(add-hook 'prog-mode-hook 'flycheck-mode)

(defun magnars/adjust-flycheck-automatic-syntax-eagerness ()
  "Adjust how often we check for errors based on if there are any.

This lets us fix any errors as quickly as possible, but in a
clean buffer we're an order of magnitude laxer about checking."
  (setq flycheck-idle-change-delay
        (if flycheck-current-errors 0.5 30.0)))

;; Each buffer gets its own idle-change-delay because of the
;; buffer-sensitive adjustment above.
(make-variable-buffer-local 'flycheck-idle-change-delay)

(add-hook 'flycheck-after-syntax-check-hook
          'magnars/adjust-flycheck-automatic-syntax-eagerness)

;; Remove newline checks, since they would trigger an immediate check
;; when we want the idle-change-delay to be in effect while editing.
(setq flycheck-check-syntax-automatically '(save
                                            idle-change
                                            mode-enabled))

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-tooltip-error-messages)))

(setq tooltip-frame-parameters
  '((alpha . 20)
;;    (name . "tooltip")
  ;;  (internal-border-width . 2)
    ;;(border-width . 1)
;;    (no-special-glyphs . t)
    ))

(defun flycheck-tooltip-error-messages (errors)
  "Display ERRORS, using a graphical tooltip on GUI frames."
  (when errors
    (let ((message (mapconcat #'flycheck-error-format-message-and-id
                              errors "\n\n")))
      (tooltip-show message (not (display-graphic-p))))))


(defun flycheck-handle-idle-change ()
  "Handle an expired idle time since the last change.

This is an overwritten version of the original
flycheck-handle-idle-change, which removes the forced deferred.
Timers should only trigger inbetween commands in a single
threaded system and the forced deferred makes errors never show
up before you execute another command."
  (flycheck-clear-idle-change-timer)
  (flycheck-buffer-automatically 'idle-change))

(provide 'setup-flycheck)
