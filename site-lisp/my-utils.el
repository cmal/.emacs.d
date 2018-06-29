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

(defun first-existing-file-in-list (files-list)
  (when (not (null files-list))
      (let ((file (car files-list)))
        (if (file-exists-p file)
            file
          (first-existing-file-in-list (cdr files-list))))))

(provide 'my-utils)
