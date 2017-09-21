
(setq-default delete-by-moving-to-trash t)

;; Move to trash when deleting stuff
(when is-mac 
  (setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs"))

;; (add-hook 'view-mode-hook
;;     (lambda() (set-fringe-mode '(0 . 0))))
(if (display-graphic-p) (set-fringe-mode '(0 . 0)))
(global-set-key (kbd "s-p") 'scroll-down-line)
(global-set-key (kbd "s-n") 'scroll-up-line)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-s-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-s-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "<s-mouse-1>") 'mc/add-cursor-on-click)

(require 'smart-forward)

;; (require 'golden-ratio-scroll-screen)
;; (global-set-key [remap scroll-down-command] 'golden-ratio-scroll-screen-down)
;; (global-set-key [remap scroll-up-command] 'golden-ratio-scroll-screen-up)

 ;; highlight FIXME TODO BUG (...)
(require 'fic-mode)
(add-hook 'prog-mode-hook 'fic-mode)

;; auto indent
;; (defun set-newline-and-indent ()
;; ;;  (local-set-key (kbd "RET") 'newline-and-indent))
;;   (local-set-key (kbd "RET") 'electric-newline-and-maybe-indent))
;; (electric-indent-mode)  ;; comment due to aggressive-indent-mode

;; (add-hook 'prog-mode-hook 'set-newline-and-indent)
;; (remove-hook 'prog-mode-hook 'set-newline-and-indent)
(add-hook 'prog-mode-hook 'linum-mode)

;; %H -> %I to make it display 12hr hours
(setq-default display-time-format "%H:%M:%S %Y/%m/%d")
;; caution: maybe the next line will slow down your Emacs,
;; set it to 60 or more if this happens.
(setq-default display-time-interval 1)
;; (display-time-mode 1)
(global-visual-line-mode 1)
;; move-text
;; (move-text-default-bindings)


;; comment code
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive "*")
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

(global-whitespace-cleanup-mode)

(set-default 'truncate-lines t)
(require 'smartscan)
(global-smartscan-mode)

;; mic-paren
;; (paren-activate)

;; mouse scroll one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-j") 'join-line)

(global-set-key (kbd "s-t") 'transpose-paragraphs)
(global-set-key (kbd "s-[") 'backward-paragraph)
(global-set-key (kbd "s-]") 'forward-paragraph)

(setq-default scroll-margin 2)

;; auto-jump-mode
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-c C-\\") 'ace-jump-mode)
(define-key global-map (kbd "C-c C-/") 'ace-jump-mode-pop-mark)

(require 'markdown-mode)
(define-key markdown-mode-map (kbd "C-c C-s") 'pinyin-search)

;;If you use viper mode :
;; (define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
;; (define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(require 'editorconfig)
(editorconfig-mode 1)

;; abbrev-mode
(setq abbrev-file-name "~/.emacs.d/abbrev-defs.el")
(setq save-abbrevs t)
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(setq default-abbrev-mode t)
;; (add-hook 'ledger-mode-hook (lambda () (abbrev-mode 1)))

(setq large-file-warning-threshold 2000000)

;; a defined kbd macro
;; use for change clojure hashmap to a 2 column csv format
(fset 'hashmap-to-csv
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([4 134217790 backspace 134217788 134217848 114 101 112 108 97 99 101 45 115 116 114 105 110 103 return 44 32 return 17 10 return 134217788 134217848 114 101 112 108 97 99 101 45 115 116 114 105 110 103 return 58 return 39 return 134217788 134217848 114 101 112 108 97 99 101 45 115 116 114 105 110 103 return 32 return 44 return] 0 "%d")) arg)))

(define-key lisp-interaction-mode-map (kbd "C-M-j") 'eval-print-last-sexp)

;; input method
;; (require 'chinese-wubi)
;; (register-input-method "chinese-wubi" "Chinese-GB" 'quail-use-package "WB" "汉字输入∷五笔输入法∷")
;; (setq default-input-method "chinese-wubi")


(provide 'setup-editing)
