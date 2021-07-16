;; my utils, by yuzhao

(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

(defvar unscroll-point nil
  "Cursor position for next call to `unscroll'.")

(defvar unscroll-window-start nil
  "Window start for next call to `unscroll'.")

(defvar unscroll-hscroll nil
  "Hscroll for next call to `unscroll'.")

(defadvice scroll-up (before remember-for-unscroll
                             activate compile)
  "Remember where we started from, for `unscroll'."
  (if (not (or (eq last-command 'scroll-up)
               (eq last-command 'scroll-down)))
      (progn (setq unscroll-point (point)
                   unscroll-window-start (window-start)
                   unscroll-hscroll (window-hscroll)))))

(defun unscroll ()
  "Revert to `unscroll-point' and `unscroll-window'."
  (interactive)
  (if (not unscroll-point)
      (error "Cannot unscroll yet"))
  (goto-char unscroll-point)
  (set-window-start nil unscroll-window-start)
  (set-window-hscroll nil unscroll-hscroll))

(defun first-existing-file (files-list)
  (when (not (null files-list))
      (let ((file (car files-list)))
        (if (file-exists-p file)
            file
          (first-existing-file (cdr files-list))))))

(defun apply-macro (macro arg-list)
  (eval
   `(,macro ,@(loop for arg in arg-list
                    collect `(quote ,arg)))))

(defun append-to-list (list-var elements)
  "add-to-list add element to list and dedupe,
while append-to-list will add elements one by one to list using add-to-list."
  (while elements
    (add-to-list list-var (car elements))
    (setq elements (cdr elements))))

;; https://github.com/doublep/datetime
(require 'datetime)
;; (prin1-to-string (sort (datetime-list-locales t) #'string<))
;; (prin1-to-string (sort (datetime-list-timezones) #'string<))
(defun parse-datetime (fmt ts)
  ;; example params:
  ;; fmt: "yyyy-MM-dd HH:mm:ss.SSS"
  ;; ts: "2018-09-18 21:20:00.000"
  ;; call (parse-datetime "yyyy-MM-dd HH:mm:ss.SSS" "2018-09-18 21:20:00.000")
  (let ((parser (datetime-parser-to-float
                 'java fmt
                 :timezone 'Asia/Shanghai)))
    (funcall parser ts)))

(provide 'my-utils)
