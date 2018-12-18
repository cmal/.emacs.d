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

(require 'cl)

(eval-after-load "js"
  '(defun js--proper-indentation (parse-status)
     "Return the proper indentation for the current line."
     (save-excursion
       (back-to-indentation)
       (cond ((nth 4 parse-status)
              (js--get-c-offset 'c (nth 8 parse-status)))
             ((nth 8 parse-status) 0) ; inside string
             ((js--ctrl-statement-indentation))
             ((eq (char-after) ?#) 0)
             ((save-excursion (js--beginning-of-macro)) 4)
             ((nth 1 parse-status)
              ;; A single closing paren/bracket should be indented at the
              ;; same level as the opening statement. Same goes for
              ;; "case" and "default".
              (let ((same-indent-p (looking-at
                                    "[]})]\\|\\_<case\\_>\\|\\_<default\\_>"))
                    (continued-expr-p (js--continued-expression-p)))
                (goto-char (nth 1 parse-status)) ; go to the opening char
                (if (looking-at "[({[]\\s-*\\(/[/*]\\|$\\)")
                    (progn ; nothing following the opening paren/bracket
                      (skip-syntax-backward " ")
                      (when (eq (char-before) ?\)) (backward-list))
                      (back-to-indentation)
                      (cond (same-indent-p
                             (current-column))
                            (continued-expr-p
                             (+ (current-column) (* 2 js-indent-level)
                                js-expr-indent-offset))
                            (t
                             (+ (current-column) js-indent-level
                                (case (char-after (nth 1 parse-status))
                                  (?\( js-paren-indent-offset)
                                  (?\[ js-square-indent-offset)
                                  (?\{ js-curly-indent-offset))))))
                  ;; If there is something following the opening
                  ;; paren/bracket, everything else should be indented at
                  ;; the same level.

                  ;; Modified code here:
                  (unless same-indent-p
                    (move-beginning-of-line 1)
                    (forward-char 4))
                  ;; End modified code
                  (current-column))))

             ((js--continued-expression-p)
              (+ js-indent-level js-expr-indent-offset))
             (t 0)))))


(provide 'setup-js-mode)
