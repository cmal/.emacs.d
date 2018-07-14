(defun remove-org-dir-from-list (list)
  "Remove original org path from load-path"
  (if (string-match-p (regexp-quote "/lisp/org") (car list))
      (cdr list)
    (cons (car list)
          (remove-org-dir-from-list (cdr list)))))

(defun remove-org-dir-from-load-path ()
  (setq load-path (remove-org-dir-from-list load-path)))

(remove-org-dir-from-load-path)

(add-to-list 'load-path (expand-file-name "org/lisp" site-lisp-dir))
(add-to-list 'load-path (expand-file-name "org/contrib/lisp" site-lisp-dir))

(require 'org)

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
(global-set-key (kbd "C-<escape>") 'ort/goto-todos)

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
(setq-default org-agenda-span 'week)
;;加入日记的约会提醒项目
(setq-default diary-file "~/.emacs.d/diary")
;; (appt-activate t)
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
  (interactive "*")
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

(setq-default org-agenda-files
              '("~/gits/org/" "~/gits/org/todo"))

(add-to-list 'org-modules 'org-habit)

(defun org-add-current-file-to-agenda ()
  (interactive)
  (customize-save-variable
   'org-agenda-files
   (add-to-list 'org-agenda-files buffer-file-name)))

;; screenshot on Mac OS X, depends on screencapture on mac
;; Linux can use this instead, it depends on a linux software `scrot':
;; https://code.orgmode.org/bzg/org-mode/raw/master/contrib/lisp/org-screenshot.el
(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive "*")
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
      (insert filename)))




;; key shortcuts
(defun org-mode-custom-keys-config ()
  (local-set-key (kbd "C-c i") 'insert-image-from-url)
  (local-set-key (kbd "C-c f a") 'org-add-current-file-to-agenda)
  (local-set-key (kbd "C-c x") 'my-org-screenshot))

(add-hook 'org-mode-hook 'org-mode-custom-keys-config)


;; alert
;; NOTE: PLEASE disable 勿扰模式 in System Pereference -> Notifications
;; (setq-default appt-display-duration 600)

(require 'alert)
(setq alert-default-style 'notifier) ;; or osx-notifier
;; (setq alert-notifier-command "/usr/local/bin/terminal-notifier") ;; only for 'notifier
;; (require 'org-alert)

;; ;; modify appt.el appt-display-message to add alert
;; (defun appt-display-message (string mins)
;;   "Display a reminder about an appointment.
;; The string STRING describes the appointment, due in integer MINS minutes.
;; The arguments may also be lists, where each element relates to a
;; separate appointment.  The variable `appt-display-format' controls
;; the format of the visible reminder."
;;   ;; (if appt-audible (beep 1))
;;   ;; Backwards compatibility: avoid passing lists to a-d-w-f if not necessary.
;;   (and (listp mins)
;;        (= (length mins) 1)
;;        (setq mins (car mins)
;;              string (car string)))
;;   (cond ((eq appt-display-format 'window)
;;          ;; TODO use calendar-month-abbrev-array rather than %b?
;;          (let ((time (format-time-string "%a %b %e "))
;;                err)
;;            (condition-case err
;;                (funcall appt-disp-window-function
;;                         (if (listp mins)
;;                             (mapcar 'number-to-string mins)
;;                           (number-to-string mins))
;;                         time string)
;;              (wrong-type-argument
;;               (if (not (listp mins))
;;                   (signal (car err) (cdr err))
;;                 (message "Argtype error in `appt-disp-window-function' - \
;; update it for multiple appts?")
;;                 ;; Fallback to just displaying the first appt, as we used to.
;;                 (funcall appt-disp-window-function
;;                          (number-to-string (car mins)) time
;;                          (car string))))))
;;          (run-at-time (format "%d sec" appt-display-duration)
;;                       nil
;;                       appt-delete-window-function))
;;         ((eq appt-display-format 'echo)
;;          (message "%s" (if (listp string)
;;                            (mapconcat 'identity string "\n")
;;                          string)))
;;         ((eq appt-display-format 'alert)
;;          (alert (if (listp string)
;;                     (mapconcat 'identity string "\n")
;;                   string)
;;                 :title "APPT"))))

;; (setq appt-display-format 'alert)

;; end alert


;; another alert
;; NOTE: PLEASE disable 勿扰模式 in System Pereference -> Notifications
(require 'appt)
(setq appt-time-msg-list nil)    ;; clear existing appt list
(setq appt-display-interval '10) ;; warn every 10 minutes from t - appt-message-warning-time
(setq appt-message-warning-time '10  ;; send first warning 10 minutes before appointment
      appt-display-mode-line nil     ;; don't show in the modeline
      appt-display-format 'window)   ;; pass warnings to the designated window function
;; (appt-activate 1)                ;; activate appointment notification
;; (org-agenda-to-appt)             ;; generate the appt list from org agenda files on emacs launch
;; (run-at-time "24:01" 360 'org-agenda-to-appt)            ;; update appt list hourly
;; (add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt) ;; update appt list on agenda view

;; set up the call to terminal-notifier
(defvar terminal-notifier-path
  "/usr/local/bin/terminal-notifier")

(defun tn-appt-send-notification (title msg)
  (shell-command (concat terminal-notifier-path " -message " msg " -title " title)))

;; an alternative command using AppleScript
(defun applescript-appt-send-notification (title message)
  (shell-command
   (concat
    "osascript" " -e 'display notification \"" message "\" with title \"" title "\"'")))

(defun applescript-appt-display (min-to-appt new-time msg)
  (applescript-appt-send-notification
   (format "'Appointment in %s minutes'" min-to-app)
   (format "'%s'" msg)))

(defun applescript-appt-delete ())

;; designate the window function for my-appt-send-notification
(defun tn-appt-display (min-to-app new-time msg)
  (tn-appt-send-notification
   ;; passed to -title in terminal-notifier call
   (format "'Appointment in %s minutes'" min-to-app)
   ;; passed to -message in terminal-notifier call
   (format "'%s'" msg)))

(defun tn-appt-remove ()
  ;; NOTE: this will remove ALL notifications in terminal-notifier
  ;; this will remove notices from MAC notification center
  (shell-command (concat terminal-notifier-path " -remove " "\"ALL\"")))

(defun tn-appt-delete ()
  (comment (tn-appt-remove)))

(setq appt-disp-window-function #'tn-appt-display
      appt-delete-window-function #'tn-appt-delete)

(comment
 (setq appt-disp-window-function #'applescript-appt-display
       appt-delete-window-function #'applescript-appt-delete))

;; test
;; (tn-appt-display 3 nil "dafdsf")
;; (appt-display-message "dafsdf" 0)
;; end another alert

;; allow for export=>beamer by placing

;; #+LaTeX_CLASS: beamer in org files
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{hyperref}\n
      \\usepackage{color}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n
       \\subject{{{{beamersubject}}}}\n"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))

;; letter class, for formal letters

(add-to-list 'org-export-latex-classes
             '("letter"
               "\\documentclass[11pt]{letter}\n
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{color}"

               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; org-wunderlist settings
;; (require 'org-wunderlist)
;; according to https://github.com/myuhe/org-wunderlist.el

(comment
 ;; settings in users/yuzhao/user-settings.el
 (setq org-wunderlist-client-id "xxx"
       org-wunderlist-token "xxx"
       org-wunderlist-file "~/gits/org/wunderlist.org"
       org-wunderlist-dir "~/gits/org/org-wunderlist/"
       ;; org-wunderlist-client-secret "xxx"
       ;; org-wunderlist-url "http://localhost/nonexisting_url"
       ;; org-wunderlist-auth-callback-url "http://localhost/nonexisting_url"
       )
 (setq org-redmine-uri "http://redmine.9sand.cn:10086"
       org-redmine-auth-api-key "xxx"))

;; org-capture template
(require 'org-protocol)
(setq org-capture-templates
      (quote
       (("p"
         "Selected template for Chrome Org Capture"
         entry
         (file+headline "~/gits/org/capture.org" "Webpage Selected")
         "* %^{Title} %:description \n\n %:initial \n\n Source: %u, %c\n\n %i \n\n %:link \n\n Timestamp: %t"
         :empty-lines 1)
        ("L"
         "UnSelected template for Chrome Org Capture"
         entry
         (file+headline "~/gits/org/capture.org" "Webpage whole")
         "* %^{Title} %:description\n\n Source: %u, %c\n\n %i \n\n %:link \n\n Timestamp:%t"
         :empty-lines 1))))

;; https://orgmode.org/worg/org-contrib/org-drill.html SRS
;; I am using it for vocabulary building
(require 'org-drill)
(setq org-drill-maximum-items-per-session 20)
(setq org-drill-maximum-duration 15)   ; 15 minutes
;; (setq org-drill-spaced-repetition-algorithm 'simple8)
(setq org-drill-add-random-noise-to-intervals-p t)

(setq my-org-files-dir
      (expand-file-name "org" my-gits-dir))

(setq my-english-org-file-path
      (expand-file-name "english.org" my-org-files-dir))

(provide 'setup-org)
