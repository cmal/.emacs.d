;; eval the last sexp and replace it with the result
(defun eval-replace-last-sexp ()
  (interactive)
  (let ((value (eval (preceding-sexp))))
    (kill-sexp -1)
    (insert (format "%S" value))))

(provide 'setup-elisp)
