;;; package --- save-ts.el

;;; Commentary:

;;

;;; Code:

(defun save-buffer-preserving-modtime ()
  ;; looted from
  ;; https://emacs.stackexchange.com/questions/13541/save-changes-to-an-emacs-file-without-changing-the-date
  "Call `save-buffer', but keep the visited file's modtime the same."
  (interactive)
  (let ((original-time (visited-file-modtime)))
    (save-buffer)
    (set-file-times buffer-file-name original-time)
    (set-visited-file-modtime original-time)))

(provide 'save-ts)

;;; save-ts.el ends here
