;; settings for org-capture
(defvar org-capture-sdcv-this-word)

(defun org-capture-sdcv-result ()
  ;; D is org-template k for sdcv
  (interactive)
  (goto-char (point-min))
  ;; replace all pronuciations 
  (while (re-search-forward "\\[" nil t)
    (replace-match "{"))
  (goto-char (point-min))
  (while (re-search-forward "\\]" nil t)
    (replace-match "}"))
  (mark-whole-buffer)
  (funcall 'org-capture nil "D")
  (save-buffer)
  (quit-window)
  (quit-restore-window))

;; the following requires `setup-sdcv.el'
(defun sdcv-capture-template ()
  (concat "* " org-capture-sdcv-this-word
          "\n\n [ \n\n %i \n\n Timestamp: %t  ] "))

(eval-after-load 'setup-org '(add-to-list 'org-capture-templates
              '("D"
                "English Word from sdcv"
                entry
                (file+headline "~/gits/org/english.org" "Words")
                (function sdcv-capture-template)
                ;; :current-word org-capture-sdcv-this-word
                :empty-lines 1)))

;;; a working sdcv version kid-sdcv
(defun sdcv-to-buffer ()
  (interactive)
  (let ((word (if mark-active
                  (buffer-substring-no-properties (region-beginning) (region-end))
                (current-word nil t))))
    (comment (setq word (read-string (format "Search the dictionary for (default %s): " word)
                                     nil nil word)))
    (setq org-capture-sdcv-this-word word)
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (let ((process (start-process-shell-command "sdcv" "*sdcv*" (concat "sdcv -n0 " word))))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) "*sdcv*")
             (switch-to-buffer-other-window "*sdcv*")
             (local-set-key (kbd "d") 'sdcv-to-buffer)
             (local-set-key (kbd "q") 'quit-window)
             (local-set-key (kbd "c") 'org-capture-sdcv-result))
           (goto-char (point-min))))))))

;; end of kid-sdcv

;; 恢复弹出前 window layout
;; 如果有一个 before-popup-hook 的话, 可以把 layout 存成一个全局变量


;; emacs-powerthesaurus
;; powerthesaurus-lookup-word
;; powerthesaurus-lookup-word-at-point
(define-key global-map (kbd "C-c d t") 'powerthesaurus-lookup-word-at-point)
(define-key global-map (kbd "C-c d v") 'sdcv-to-buffer)


(provide 'setup-dict)
