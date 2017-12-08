;;; setup-js-mode.el --- tweak js-mode settings -*- lexical-binding: t; -*-

(add-hook 'js-mode-hook 'electric-pair-local-mode)
(defun my-electric-pair-post-self-insert-function (orig-fun)
  (let ((indent-after (and (eq last-command-event ?\n)
                           (< (1+ (point-min)) (point) (point-max))
                           (eq (save-excursion
                                 (skip-chars-backward "\t\s")
                                 (char-before (1- (point))))
                               (matching-paren (char-after))))))
    (apply orig-fun nil)
    (when indent-after
      (indent-according-to-mode)
      (save-excursion
        (forward-line 1)
        (indent-according-to-mode)))))

(advice-add 'electric-pair-post-self-insert-function :around #'my-electric-pair-post-self-insert-function)

(provide 'setup-js-mode)
