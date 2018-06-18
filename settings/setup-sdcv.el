;;; a working sdcv version kid-sdcv
(defun kid-sdcv-to-buffer ()
  (interactive)
  (let ((word (if mark-active
                  (buffer-substring-no-properties (region-beginning) (region-end))
                (current-word nil t))))
    (comment (setq word (read-string (format "Search the dictionary for (default %s): " word)
                             nil nil word)))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (let ((process (start-process-shell-command "sdcv" "*sdcv*" "sdcv" "-n0" word)))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) "*sdcv*")
             (setq kid-sdcv-window-configuration (current-window-configuration))
             (switch-to-buffer-other-window "*sdcv*")
             (local-set-key (kbd "d") 'kid-sdcv-to-buffer)
             (local-set-key (kbd "q") (lambda ()
                                        (interactive)
                                        (bury-buffer)
                                        ;; new add, need to be changed -->
                                        (other-window -1)
                                        ;; <--
                                        (comment
                                         (unless (null (cdr (window-list))) ; only one window
                                           (delete-window))))))
           (goto-char (point-min))))))))

;; end of kid-sdcv

;; 恢复弹出前 window layout
;; 如果有一个 before-popup-hook 的话, 可以把 layout 存成一个全局变量


;; emacs-powerthesaurus
;; powerthesaurus-lookup-word
;; powerthesaurus-lookup-word-at-point
(define-key global-map (kbd "C-c d t") 'powerthesaurus-lookup-word-at-point)
(define-key global-map (kbd "C-c d v") 'kid-sdcv-to-buffer)


(provide 'setup-dict)
