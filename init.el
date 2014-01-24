;-*- coding: utf-8 -*-

;;  ------------------------------------
;; | Section I: Custom GUI              |
;;  ------------------------------------

(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
                 '(progn
                    (color-theme-initialize)
;;                    (color-theme-bharadwaj-slate)))
;;                   (color-theme-classic)))
                    (color-theme-dark-laptop)))
;;                    (color-theme-rotor)))
;;                    (color-theme-charcoal-black)))
;;                    (color-theme-infodoc)))

(set-face-attribute
  'default nil :font "Monaco 14")

;; font Inconsolata -- use when programming
;; (set-face-attribute 'default nil
;; 		    :family "Inconsolata" :height 140)
;; (set-face-attribute 'font-lock-comment-face nil
;; 		    :family "Optima" :height 140 :slant 'italic
;; 		    :backgrount "#ddddee" :foreground "#000000")
;; (set-face-attribute 'font-lock-string-face nil
;; 		    :family "Anonymous Pro" :height 130 :weight 'bold
;; 		    :foreground "black" :background 'unspecified)

;; font Anonymous Pro
;; (set-face-attribute 'default nil
;;		    :family "Anonymous Pro" :height 140)
;; (set-face-attribute 'font-lock-comment-face nil
;; 		    :family "Optima" :height 140 :slant 'italic
;; ;		    :family "Anonymous Pro" :height 140 :slant 'italic
;; 		    :background "#ddddee" :foreground "#000000")

(set-fontset-font
    (frame-parameter nil 'font)
    'han
;    (font-spec :family "翩翩体-简" :size 14))
;    (font-spec :family "手札体-简" :size 16))
;    (font-spec :family "MingLiU" :size 16))
    (font-spec :family "冬青黑体简体中文" :size 14))

(tool-bar-mode 0)
(scroll-bar-mode 0)

(add-to-list 'default-frame-alist '(width  . 81))
(add-to-list 'default-frame-alist '(height  . 40))

;; txt结尾的文件的名字优先用中文编码显示
(modify-coding-system-alist 'file "\\.txt\\'" 'chinese-iso-8bit)

;; eim输入法, 已merge搜狗输入法词库
(add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
(autoload 'eim-use-package "eim" "Another emacs input method")
(setq eim-use-tooltip t)
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
  "拼音" "汉字拼音输入法" "py.txt")

;;  ----------------------------------
;; | Section II: Custom Org-mode GTD  |
;;  ----------------------------------

(add-hook 'org-mode-hook 'visual-line-mode)

;; Org-mode global key setting
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cms" 'org-mobile-push)
(global-set-key "\C-cml" 'org-mobile-pull)

;; add done time to org headlines,
;; if want to add notes, replace 'time with 'note
(setq org-log-done 'time)

;; to save the clock history across Emacs sessions.
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/org/emacs.org"))))

;; to custom the identification of stuck project
(setq org-stuck-projects
      '("+Project/-SDMAYBE-DONE" ("TODO" "QUESTION" "DELEGATED")))

;; setup MobileOrg directory
;; 中文Dropbox应用程序专用路径与英文不同，应用而不是Apps
(setq org-mobile-directory "~/Dropbox/应用/MobileOrg")

;; 快速TODO标签
(setq org-use-fast-todo-selection t)

;;忽略scheduled和deadlined的todo项目
;;使得todo列表更为紧凑，因为这些项目在agenda列表中显示了
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-ignore-deadlines t)

;;修改Agenda View显示时间
(setq org-agenda-span 2 days)

;;  ------------------------
;; | Section III: Editing   |
;;  ------------------------

;(delete-selection-mode)

;; 单行滚动
(global-set-key (kbd "M-p") 'scroll-down-line)
(global-set-key (kbd "M-n") 'scroll-up-line)

;; view-mode自动取消fringe
;;(add-hook 'view-mode-hook


;;  -------------------------
;; | Section IV: Shortcuts   |
;;  -------------------------

;; register this file name
(set-register ?i '(file . "~/.emacs.d/init.el"))

;; bookmark this file
;; already done

