(defun myorg-update-parent-cookie ()
  (when (equal major-mode 'org-mode)
    (save-excursion
      (ignore-errors
        (org-back-to-heading)
        (org-update-parent-todo-statistics)))))

(defadvice org-kill-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

(defadvice kill-whole-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

;; (setq org-directory "~/Dropbox/org")
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
;; (define-key global-map (kbd "M-<f6>") 'org-capture)

(global-set-key (kbd "C-'") 'ort/capture-todo)
;;(global-set-key (kbd "C-;") 'ort/capture-checkitem)
(global-set-key (kbd "C-`") 'ort/goto-todos)

;; org-redmine
(setq org-redmine-uri "http://redmine.9sand.cn:10086")
(setq org-redmine-auth-api-key "80eae813c8a8c81126d07c604173a43bd0e0e78d")

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;; Org-mode global key setting
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)


;; add done time to org headlines,
;; if want to add notes, replace 'time with 'note
(setq-default org-log-done 'time)
;;(setq org-clock-continuously t)
;; to save the clock history across Emacs sessions.
(setq-default org-clock-persist 'history)
(org-clock-persistence-insinuate)


;; 快速TODO标签
(setq-default org-use-fast-todo-selection t)
;;忽略scheduled和deadlined的todo项目
;;使得todo列表更为紧凑，因为这些项目在agenda列表中显示了
(setq-default org-agenda-todo-ignore-scheduled t)
(setq-default org-agenda-todo-ignore-deadlines t)
;;修改Agenda View显示时间
(setq-default org-agenda-span 1 days)
;;加入日记的约会提醒项目
(setq-default diary-file "~/.emacs.d/diary")
;(appt-activate t)
;; 更改org-clock-table时间显示
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
;; 将org mode的层级标识显示为utf-8字符
;; (load-file "~/.emacs.d/site-lisp/org-bullets.el")
;; (require 'org-bullets)
;; (add-hook 'org-mode-hook (lambda() (org-bullets-mode)))

(global-set-key (kbd "C-'") 'ort/capture-todo)
;; (global-set-key (kbd "C-'") 'ort/capture-checkitem)
(global-set-key (kbd "C-`") 'ort/goto-todos)

;; show image from url at point, not persistent
;; or use M-x ffap to show image in browser
;; (require 'url)
(defun insert-image-from-url (&optional url)
  (interactive)
  (unless url (setq url (url-get-url-at-point)))
  (unless url
    (error "Couldn't find URL."))
  (let ((buffer (url-retrieve-synchronously url)))
    (unwind-protect
         (let ((data (with-current-buffer buffer
                       (goto-char (point-min))
                       (search-forward "\n\n")
                       (buffer-substring (point) (point-max)))))
           (insert-image (create-image data nil t)))
      (kill-buffer buffer))))

(defun org-mode-custom-keys-config ()
  (local-set-key (kbd "C-c i") 'insert-image-from-url))
(add-hook 'org-mode-hook 'org-mode-custom-keys-config)

(provide 'setup-org)
