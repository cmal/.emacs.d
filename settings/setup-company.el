;; If you'd prefer to trigger completions manually:
(setq company-idle-delay nil) ; never start completions automatically

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; (defun my-expand-lines ()
;;   (interactive)
;;   (let ((hippie-expand-try-functions-list
;;          '(try-expand-line)))
;;     (call-interactively 'hippie-expand)))

;; (define-key evil-insert-state-map (kbd "C-x C-l") 'my-expand-lines)

;; TODO try to use hippie-expand to make a completion list
;;  for use of company-complete
;; refer to try-expand-line of hippie-expand
;; and bind it to C-x C-l
;; (global-set-key (kbd "C-x C-l") #'my-try-expand-company)

(global-set-key (kbd "C-x C-p") #'company-complete)

(provide 'setup-company)
