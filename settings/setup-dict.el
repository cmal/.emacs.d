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
  (with-current-buffer "english.org"
    (save-buffer))
  (kill-buffer "*sdcv*")
  (kill-buffer "CAPTURE-english.org")
  (set-window-configuration window-configuration-before-sdcv))

;; the following requires `setup-sdcv.el'
(defun sdcv-capture-template ()
  (concat "* " org-capture-sdcv-this-word
          "\n\n [ \n\n %i \n\n Timestamp: %t  ] "))

(eval-after-load 'setup-org '(add-to-list 'org-capture-templates
              '("D"
                "English Word from sdcv"
                entry
                (file+headline my-english-org-file-path "Words")
                (function sdcv-capture-template)
                ;; :current-word org-capture-sdcv-this-word
                :empty-lines 1)))

;;; a working sdcv version kid-sdcv
(defun sdcv-to-buffer ()
  (interactive)
  (setq window-configuration-before-sdcv (current-window-configuration))
  (let ((word (if mark-active
                  (buffer-substring-no-properties (region-beginning) (region-end))
                (current-word nil t))))
    (setq org-capture-sdcv-this-word word)
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (let ((process (start-process-shell-command "sdcv" "*sdcv*" (concat "sdcv -n0 '" word "'"))))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) "*sdcv*")
             (switch-to-buffer-other-window "*sdcv*")
             (local-set-key (kbd "d") 'sdcv-to-buffer)
             (local-set-key (kbd "q") 'quit-window)
             (local-set-key (kbd "c") 'org-capture-sdcv-result)
             (goto-char (point-min)))))))))


(defun call-sdcv-to-english-org (word &optional next-words)
  "run asyncronous process, calls recursively if words not nil"
  (lexical-let ((word word)
                (next-words next-words))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (insert "[\n\n")
    (let ((process (start-process-shell-command "sdcv" "*sdcv*" (concat "sdcv -n0 " (shell-quote-argument word)))))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (with-current-buffer "*sdcv*"
             (goto-char (point-max))
             (insert "\n\n ] \n")
             (setq sdcv-result (buffer-string)))
           (with-current-buffer (or (get-file-buffer my-english-org-file-path)
                                    (find-file-noselect my-english-org-file-path))
           ;; TODO
           ;; skip when english.org *Words alread has this word entry.
             (goto-char (point-max))
             (let ((stars (make-string (org-current-level) ?*)))
               (insert stars " " word "\n" sdcv-result)
               (if next-words
                 (funcall 'call-sdcv-to-english-org
                          (car next-words)
                          (cdr next-words))
                 (save-buffer))))
           (message "DONE.")))))))

(defun sdcv-to-english-org (&optional a-word)
  (interactive)
  (let ((word (or a-word
                  (if mark-active
                      (buffer-substring-no-properties
                       (region-beginning)
                       (region-end))
                    (current-word nil t)))))
    (call-sdcv-to-english-org word)))

(defun batch-sdcv-to-english-org ()
  (interactive)
  (setq words (split-string
               (buffer-substring-no-properties (point-min) (point-max))
               "\n" t "\\ *"))
  (call-sdcv-to-english-org (car words) (cdr words)))


;; emacs-powerthesaurus
;; powerthesaurus-lookup-word
;; powerthesaurus-lookup-word-at-point
(require 'powerthesaurus)
;; s 同义词
(define-key global-map (kbd "C-c d s") 'powerthesaurus-lookup-word-at-point)
(define-key global-map (kbd "C-c d v") 'sdcv-to-buffer)


(use-package youdao-dictionary
  :ensure t
  :demand t)

(provide 'setup-dict)
