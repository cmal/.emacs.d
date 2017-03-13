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

(defun org-add-current-file-to-agenda ()
  (interactive)
  (customize-save-variable
   'org-agenda-files
   (add-to-list 'org-agenda-files buffer-file-name)))



;; screenshot
(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (org-display-inline-images)
  (setq filename
        (concat
         (make-temp-name
          (concat (file-name-nondirectory (buffer-file-name))
                  "_imgs/"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
  ; take screenshot
  (if (eq system-type 'darwin)
      (call-process "screencapture" nil nil nil "-i" filename))
  (if (eq system-type 'gnu/linux)
      (call-process "import" nil nil nil filename))
  ; insert into file if correctly taken
  (if (file-exists-p filename)
    (insert (concat "[[file:" filename "]]"))))


;; key shortcuts
(defun org-mode-custom-keys-config ()
  (local-set-key (kbd "C-c i") 'insert-image-from-url)
  (local-set-key (kbd "C-c f a") 'org-add-current-file-to-agenda)
  (local-set-key (kbd "C-c x") 'my-org-screenshot))

(add-hook 'org-mode-hook 'org-mode-custom-keys-config)

(setq-default appt-display-duration 600)

(require 'alert)
(setq alert-default-style 'notifier) ;; or osx-notifier
(setq alert-notifier-command "/usr/local/bin/terminal-notifier") ;; only for 'notifier
(require 'org-alert)


;; modify appt.el appt-display-message to add alert
(defun appt-display-message (string mins)
  "Display a reminder about an appointment.
The string STRING describes the appointment, due in integer MINS minutes.
The arguments may also be lists, where each element relates to a
separate appointment.  The variable `appt-display-format' controls
the format of the visible reminder.  If `appt-audible' is non-nil,
also calls `beep' for an audible reminder."
  (if appt-audible (beep 1))
  ;; Backwards compatibility: avoid passing lists to a-d-w-f if not necessary.
  (and (listp mins)
       (= (length mins) 1)
       (setq mins (car mins)
             string (car string)))
  (cond ((eq appt-display-format 'window)
         ;; TODO use calendar-month-abbrev-array rather than %b?
         (let ((time (format-time-string "%a %b %e "))
               err)
           (condition-case err
               (funcall appt-disp-window-function
                        (if (listp mins)
                            (mapcar 'number-to-string mins)
                          (number-to-string mins))
                        time string)
             (wrong-type-argument
              (if (not (listp mins))
                  (signal (car err) (cdr err))
                (message "Argtype error in `appt-disp-window-function' - \
update it for multiple appts?")
                ;; Fallback to just displaying the first appt, as we used to.
                (funcall appt-disp-window-function
                         (number-to-string (car mins)) time
                         (car string))))))
         (run-at-time (format "%d sec" appt-display-duration)
                      nil
                      appt-delete-window-function))
        ((eq appt-display-format 'echo)
         (message "%s" (if (listp string)
                           (mapconcat 'identity string "\n")
                         string)))
        ((eq appt-display-format 'alert)
         (alert (if (listp string)
                    (mapconcat 'identity string "\n")
                  string)
                :title "APPT"))))

(setq appt-display-format 'alert)

(provide 'setup-org)
