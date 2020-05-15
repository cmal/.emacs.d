;;; setup-company.el --- tweak company settings -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; If you'd prefer to trigger completions manually:
;; (setq company-idle-delay nil) ;; nil: never start completions automatically

(use-package company
  :config

  ;; (defun company-after-completion-hook (&rest _ignored)
  ;;   ;; this would be called with the completion candidate, so you could
  ;;   ;; modify it to insert spaces based on the candidate
  ;;   (just-one-space))
  ;; or setq-local in a mode hook, eg. for text-mode/org-mode or wherever you are
  ;; completing with dictionary words 

  ;; (setq company-completion-finished-hook (lambda (&rest _ignored) (just-one-space)))
  (setq company-idle-delay 0)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)

  (global-set-key (kbd "C-x C-p") #'company-complete)
  (global-set-key (kbd "C-x C-l")
                  (lambda ()
                    (interactive)
                    (let ((hippie-expand-try-functions-list '(try-expand-line)))
                      (call-interactively 'hippie-expand)))))

(provide 'setup-company)
;;; setup-company.el ends here
