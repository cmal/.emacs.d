;-*- coding: utf-8 -*-

;;  ------------------------------------
;; | Section I: Custom GUI              |
;;  ------------------------------------

(set-face-attribute
  'default nil :font "Monaco 14")
(set-fontset-font
    (frame-parameter nil 'font)
    'han
    (font-spec :family "翩翩体-简" :size 16))
;    (font-spec :family "手札体-简" :size 16))
;    (font-spec :family "MingLiU" :size 16))
;    (font-spec :family "冬青黑体简体中文" :size 15))

(tool-bar-mode 0)
(scroll-bar-mode 0)

(add-to-list 'default-frame-alist '(width  . 81))
(add-to-list 'default-frame-alist '(height  . 40))

;; txt结尾的文件的名字优先用中文编码显示
(modify-coding-system-alist 'file "\\.txt\\'" 'chinese-iso-8bit)

;; eim输入法, 可merge搜狗输入法词库
(add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
(autoload 'eim-use-package "eim" "Another emacs input method")
(setq eim-use-tooltip t)
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
  "拼音" "汉字拼音输入法" "py.txt")
;; 用 ; 暂时输入英文
(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)

;;  ----------------------------------
;; | Section II: Custom Org-mode GTD  |
;;  ----------------------------------

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
