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

(set-fringe-mode '(0 . 4)) ;; half-width, right-only
;; (add-hook 'view-mode-hook
;;     (lambda() (set-fringe-mode '(0 . 0))))
;; (if (display-graphic-p) (set-fringe-mode '(0 . 0)))


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

;; (load-file (concat custom-theme-directory "/color-theme-tomorrow.el"))
;; (load-theme 'tomorrow-night-bright)
;; (load-theme 'afternoon)
;; (load-theme 'monokai) ; load later
;; (load-theme 'word-perfect)
;; (load-theme 'cyberpunk)
;; (load-theme 'monokai)
;; (load-theme 'leuven)
;; (load-theme 'desert)
;; (load-theme 'afternoon)
;; (load-theme 'doom-challenger-deep)
;; (load-theme 'doom-tomorrow-day)
;; (load-theme 'doom-nord-light)
(load-theme 'doom-dracula)
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

;; show-paren-mode
(show-paren-mode 1)
(custom-set-variables
 '(show-paren-match ((t (:background "#373E4C" :foreground "#BF616A" :weight normal))))
 '(show-paren-mismatch ((t (:background "#BF616A" :foreground "#373E4C" :weight normal)))))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Make zooming affect frame instead of buffers
;; (require 'zoom-frm)

;; (add-to-list 'default-frame-alist '(width  . 160))
;; (add-to-list 'default-frame-alist '(height  . 80))

;; (toggle-frame-fullscreen)

;; tabbar

;; (require 'tabbar)

;; (defun my-tabbar-buffer-groups (buffer)
;;   "Put files in the same directory into the same tab bar"
;;     (with-current-buffer (get-buffer buffer)
;;       (list (expand-file-name default-directory))))
;; (setq tabbar-buffer-groups-function
;;       'my-tabbar-buffer-groups)


;; Use special font for w3m, info ... for reading

;; Use variable width font faces in current buffer
(defun reading-face-mode-variable ()
  "Set font to non-monospace, for reading"
  (interactive)
  (setq buffer-face-mode-face '(:family "Big Caslon" :width semi-condensed))
  (buffer-face-mode))

;; "Baskerville" "Didot" "Monaco" "Cochin" "Big Caslon"
;;  :width semi-condensed

;; Use monospaced font faces in current buffer
;; (defun my-buffer-face-mode-fixed ()
;;   "Sets a fixed width (monospace) font in current buffer"
;;   (interactive)
;;   (setq buffer-face-mode-face '(:family "Inconsolata" :height 100))
;;   (buffer-face-mode))

;; Set default font faces for Info and ERC modes
;; (add-hook 'erc-mode-hook 'my-buffer-face-mode-variable)
;; (add-hook 'Info-mode-hook 'my-buffer-face-mode-variable)
(add-hook 'w3m-mode-hook 'reading-face-mode-variable)


;; mode-line, diminish
(diminish 'editorconfig-mode "EC")
(diminish 'helm-mode)
(diminish 'encourage-mode)
(diminish 'undo-tree-mode "UT")
(diminish 'abbrev-mode "Ab")
(diminish 'visual-line-mode "VL")

(provide 'setup-appearance)
;;; setup-appearance.el ends here
