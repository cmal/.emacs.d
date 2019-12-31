;; flymd has cors problems!!

;; use impatient-mode
(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
           (format
            "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
         (current-buffer)))

;; (defun markdown-impatient-preview ()
;;   (interactive)
;;   (when (not (httpd-running-p))
;;     (httpd-start))
;;   (impatient-mode)
;;   (imp-set-user-filter 'markdown-html)
;;   (let ((url (concat "http://localhost:8080/imp/live/" (buffer-name) "/"))
;;         (process-environment (browse-url-process-environment)))
;;         (apply 'start-process
;;            (concat "safari markdown")
;;            nil
;;            "/usr/bin/open"
;;            (list "-a" "Safari" url))))

(defun markdown-impatient-preview ()
  (interactive)
  (when (not (httpd-running-p))
    (httpd-start))
  (impatient-mode)
  (imp-set-user-filter 'markdown-html)
  (let ((url (concat "http://localhost:8080/imp/live/" (buffer-name) "/"))
        (process-environment (browse-url-process-environment)))
    (xwidget-webkit-browse-url url)))


;; (setq markdown-mode-hook nil)
(add-hook 'markdown-mode-hook 'markdown-impatient-preview)

(provide 'setup-markdown)
