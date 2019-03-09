;;; setup-company.el --- tweak company settings -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; If you'd prefer to trigger completions manually:
;; (setq company-idle-delay nil) ;; nil: never start completions automatically
(setq company-idle-delay 0)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(global-set-key (kbd "C-x C-p") #'company-complete)
(global-set-key (kbd "C-x C-l")
                (lambda ()
                  (interactive)
                  (let ((hippie-expand-try-functions-list '(try-expand-line)))
                    (call-interactively 'hippie-expand))))

(provide 'setup-company)
;;; setup-company.el ends here
