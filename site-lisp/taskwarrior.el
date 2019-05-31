;;; taskwarrior.el --- Taskwarrior client for Emacs

;; Copyright (C) 2015  Andrey Lisin <andrey.lisin@gmail.com>

;; Author: Andrey Lisin <andrey.lisin@gmail.com>
;; Keywords: taskwarrior
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Rule taskwarrior from Emacs
;;
;; Have a nice day!

;;; Code:

(defvar taskwarrior-mode-hook nil)

(defvar taskwarrior-buffer-name "*taskwarrior*"
  "Name of the taskwarrior buffer.")

(defvar taskwarrior-map (make-sparse-keymap)
  "The keymap to use with taskwarrior.")

(if taskwarrior-map
    (progn
      (define-key taskwarrior-map (kbd "g") 'taskwarrior)
      (define-key taskwarrior-map (kbd "a") 'taskwarrior-add-task)
      (define-key taskwarrior-map (kbd "d") 'taskwarrior-done-task)
      (define-key taskwarrior-map (kbd "D") 'taskwarrior-delete-task)

      ;; FIXME: either implementation will get non utf-8 task will 100% CPU
      ;; (define-key taskwarrior-map (kbd "i") 'taskwarrior-task-info)

      (define-key taskwarrior-map (kbd "p") 'taskwarrior-task-depends-on)
      (define-key taskwarrior-map (kbd "o") 'taskwarrior-set-priority)
      (define-key taskwarrior-map (kbd "b") 'taskwarrior-blocked)
      (define-key taskwarrior-map (kbd "B") 'taskwarrior-blocking)
      (define-key taskwarrior-map (kbd "C-b") 'taskwarrior-blocking-not-blocked)
      (define-key taskwarrior-map (kbd "S") 'taskwarrior-start)
      (define-key taskwarrior-map (kbd "q") 'quit-window)))

(defun task-sync ()
  (interactive)
  (shell-command "task sync"))

(defun display-tasks (&optional tag)
  (task-sync)
  (let* ((cmd-str (if tag (format "task +%s" tag) "task"))
         (shell-output (shell-command-to-string cmd-str))
         (taskwarrior-buffer (get-buffer-create taskwarrior-buffer-name)))
    (switch-to-buffer taskwarrior-buffer)
    (erase-buffer)
    (insert shell-output)))

(defun taskwarrior-add-task (task-description)
  "Add taskwarrior task."
  (interactive "sTask description: ")
  (message task-description)
  (let ((params (split-string (format "add %s" task-description))))
    (if (zerop (apply 'call-process (append (list "task" nil nil nil) params)))
        (display-tasks)
      (message (concat "Command fail: task " params)))))

(defun filter-spaces (seq)
  "Filter spaces from seq of strings."
  (delq nil (mapcar (lambda (x) (if (string-equal x " ") nil x)) seq)))

(defun get-task-id (line)
  (let ((tokens (split-string line)))
    (string-to-number (nth 0 (filter-spaces tokens)))))

(defun get-current-line-task-id ()
  (let ((current-line (thing-at-point 'line)))
    (get-task-id current-line)))

(defun taskwarrior-delete-task ()
  (interactive)
  (let* ((task-id (get-current-line-task-id)))
      (message (format "task %i delete" (string-to-number task-id)))))

(defun taskwarrior-done-task ()
  "Mark taskwarrior task as done."
  (interactive)
  (let* ((current-line (thing-at-point 'line))
         (task-id (get-task-id current-line)))
    (if (/= 0 task-id)
        (shell-command (format "task %i done" task-id)))
    (display-tasks)))

(defun taskwarrior-modify (str)
  "Modify current task"
  (let ((task-id (get-current-line-task-id)))
    (shell-command (format "task %d modify %s" task-id str))
    (display-tasks)))

(defun taskwarrior-task-depends-on (dep-id)
  "Modify current task to depends on another task by id"
  (interactive "nCurrent task depends on: ")
  (taskwarrior-modify (format "depends:%d" dep-id)))

(defun taskwarrior-set-priority (c)
  "Modify current task to priority(H/L/M)."
  (interactive "cSet task Priority (H/L/M): ")
  (when (member c '(?M ?m ?L ?l ?H ?h))
    (taskwarrior-modify (format "priority:%c" c))
    (message "Only H/L/M are accepted.")))

(defun taskwarrior-blocked ()
  "Display only those tasks which depend on another task."
  (interactive)
  (display-tasks "BLOCKED"))

(defun taskwarrior-blocking ()
  "Display only those tasks which are assigned as dependencies for another task."
  (interactive)
  (display-tasks "BLOCKING"))

(defun taskwarrior-blocking-not-blocked ()
  "Display what is blocking and is not blocked,
focusing on the tasks that block everything else."
  (interactive)
  (display-tasks "BLOCKING -BLOCKED"))

(defun taskwarrior-start ()
  "Modify current task to depends on another task by id"
  (interactive)
  (let ((task-id (get-current-line-task-id)))
    (shell-command (format "task %d start" task-id))
    (display-tasks)))

;; (defun taskwarrior-task-info ()
;;   "Show task detailed information."
;;   (interactive)
;;   (let ((task-id (get-current-line-task-id)))
;;     (when (not (zerop task-id))
;;       (set-buffer (get-buffer-create "*task-info*"))
;;       (buffer-disable-undo)
;;       (erase-buffer)
;;       (let ((process (start-process-shell-command
;;                       (format "task-info-%d" (random))
;;                       "*task-info*"
;;                       (format "task %d info" task-id))))
;;         (set-process-sentinel
;;          process
;;          (lambda (process signal)
;;            (when (memq (process-status process) '(exit signal))
;;              (unless (string= (buffer-name) "*task-info*")
;;                (switch-to-buffer-other-window "*task-info*")
;;                (require 'ansi-color)
;;                (ansi-color-apply-on-region (point-min) (point-max))
;;                (local-set-key (kbd "q") 'quit-window)
;;                (goto-char (point-min))))))))))

;; (defun my-shell-execute (cmd bf-name)
;;   (shell (get-buffer-create bf-name))
;;    (process-send-string (get-buffer-process bf-name) (concat cmd "\n")))

;; (defun taskwarrior-task-info ()
;;   "Show task detailed information."
;;   (interactive)
;;   (let ((task-id (get-current-line-task-id)))
;;     (when (/= 0 task-id)
;;       (my-shell-execute (format "task %d info" task-id) "*task-info*"))))

(defun taskwarrior ()
  "The entry point for taskwarrior client."
  (interactive)
  (display-tasks)
  (use-local-map taskwarrior-map))

(provide 'taskwarrior)
;;; taskwarrior.el ends here
