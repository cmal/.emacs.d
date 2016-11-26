(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Don't beep. Don't visible-bell (fails on el capitan). Just blink the modeline on errors.

(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.05 nil 'invert-face 'mode-line)))

;; Highlight current line
(global-hl-line-mode 1)

;; Set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

;; Default theme
;; (defun use-presentation-theme ()
;;   (interactive)
;;   (when (boundp 'magnars/presentation-font)
;;     (set-face-attribute 'default nil :font magnars/presentation-font)))

;;(defun use-default-theme ()
  ;;(interactive)
  ;; (load-theme 'default-black)
  ;; (when (boundp 'magnars/default-font)
  ;;   (set-face-attribute 'default nil :font magnars/default-font)))

;; (defun toggle-presentation-mode ()
;;   (interactive)
;;   (if (string= (frame-parameter nil 'font) magnars/default-font)
;;       (use-presentation-theme)
;;     (use-default-theme)))

;; (global-set-key (kbd "C-<f9>") 'toggle-presentation-mode)

;; (use-default-theme)

(load-file (concat custom-theme-directory "/color-theme-tomorrow.el"))
;;; (load-theme 'tomorrow-night-bright)
;;(load-theme 'afternoon)
(load-theme 'word-perfect)
;; (load-theme 'cyberpunk)
;; Don't defer screen updates when performing operations
;; (setq redisplay-dont-pause t)

;; org-mode colors
;; (setq org-todo-keyword-faces
;;       '(
;;         ("INPR" . (:foreground "yellow" :weight bold))
;;         ("DONE" . (:foreground "green" :weight bold))
;;         ("IMPEDED" . (:foreground "red" :weight bold))
;;         ))

;; Highlight matching parentheses when the point is on them.
;; (show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Make zooming affect frame instead of buffers
;; (require 'zoom-frm)

;; (add-to-list 'default-frame-alist '(width  . 160))
;; (add-to-list 'default-frame-alist '(height  . 80))

(toggle-frame-fullscreen)

(provide 'appearance)
