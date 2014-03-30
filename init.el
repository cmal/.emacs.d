;-*- coding: utf-8 -*-

;; global settings

;; 解决Emacs执行shell命令command not found的问题, 原因是.bashrc修改的path变量未起作用
;; Emacs默认以非交互式执行shell命令, 不读取.bashrc, -i指定以交互式启动bash, -c表示命令读取来自字符串, 可以通过设置BASH_ENV来指定非交互式shell的配置文件
;; bash中, 执行bash脚本的时候，如果BASH_ENV被设置的话，它就会先执行BASH_ENV指向的脚本
;; 说明: .bash_profile is loaded for your login shell only. If you want to customize regular shells (such as xterm windows, or Emacs shells), you need to put the customization in .bashrc instead. Many people will source .bashrc from .bash_profile, so that you get all of your customizations in your login shell, but only those in .bashrc in your regular shells.
(setq-default shell-command-switch "-ic")
(setq-default current-language-environment "English")
;;  -----------------------------------
;; | Section 0: Debugging              |
;;  -----------------------------------
(setq-default debug-on-error t)

;;  ------------------------------------
;; | Section I: Custom GUI              |
;;  ------------------------------------

;;(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0")
;;(require 'color-theme)
;; (eval-after-load "color-theme"
;;                  '(progn
;;                     (color-theme-initialize)
;;                    (color-theme-classic)))

;; (set-face-attribute
;; ;  'default nil :font "MingLiu 14")
;;   'default nil :font "Monaco 14")
;; ;  'default nil :font "Verdana-14")
;; (if window-system 2
;;    (set-fontset-font (frame-parameter nil 'font)
;; 	  'unicode '("simsun" . "unicode-bmp")))	

;;(add-to-list 'default-frame-alist '(font . "Monaco 14"))
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
    (font-spec :family "翩翩体-简" :size 14))
;    (font-spec :family "手札体-简" :size 14))
;    (font-spec :family "MingLiU" :size 16))
;    (font-spec :family "冬青黑体简体中文" :size 12))

(if window-system
    (tool-bar-mode 0))
(scroll-bar-mode 0)
(set-fringe-mode '(0 . 0))

(add-to-list 'default-frame-alist '(width  . 81))
(add-to-list 'default-frame-alist '(height  . 40))

;; txt结尾的文件的名字优先用中文编码显示
(modify-coding-system-alist 'file "\\.txt\\'" 'chinese-iso-8bit)

;; eim输入法, 已merge搜狗输入法词库
(add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
(autoload 'eim-use-package "eim" "Another emacs input method")
(setq-default eim-use-tooltip nil)
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
  "拼音" "汉字拼音输入法" "py.txt")

;;  ----------------------------------
;; | Section II: Custom Org-mode GTD  |
;;  ----------------------------------

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; Org-mode global key setting
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cms" 'org-mobile-push)
(global-set-key "\C-cml" 'org-mobile-pull)

;; add done time to org headlines,
;; if want to add notes, replace 'time with 'note
(setq-default org-log-done 'time)
(setq org-clock-continuously t)
;; to save the clock history across Emacs sessions.
(setq-default org-clock-persist 'history)
(org-clock-persistence-insinuate)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(org-agenda-files (quote ("~/org/emacs.org"))))

;; to custom the identification of stuck project
(setq-default org-stuck-projects
      '("+Project/-SDMAYBE-DONE" ("TODO" "QUESTION" "DELEGATED")))

;; setup MobileOrg directory
;; 中文Dropbox应用程序专用路径与英文不同，应用而不是Apps
(setq-default org-mobile-directory "~/Dropbox/应用/MobileOrg")

;; 快速TODO标签
(setq-default org-use-fast-todo-selection t)

;;忽略scheduled和deadlined的todo项目
;;使得todo列表更为紧凑，因为这些项目在agenda列表中显示了
(setq-default org-agenda-todo-ignore-scheduled t)
(setq-default org-agenda-todo-ignore-deadlines t)

;;修改Agenda View显示时间
(setq-default org-agenda-span 1 days)

;;加入日记的约会提醒项目
(setq-default diary-file "~/.emacs.d/diary")
(appt-activate t)

;;  ------------------------
;; | Section III: Editing   |
;;  ------------------------
(server-start)
;(delete-selection-mode)
(setq-default delete-by-moving-to-trash t)
;; 单行滚动
(global-set-key (kbd "M-p") 'scroll-down-line)
(global-set-key (kbd "M-n") 'scroll-up-line)

;; view-mode自动取消fringe
(add-hook 'view-mode-hook (set-fringe-mode 0))


;;  -------------------------
;; | Section IV: Shortcuts   |
;;  -------------------------

;; register this file name
;;(set-register ?i '(file . "~/.emacs.d/init.el"))

;; bookmark this file
;; already done

(setq default-input-method 'eim-py)
(set-input-method 'eim-py)

;;  ------------------------
;; | Section IV: Calendar   |
;;  ------------------------

;; 让emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
;(setq-default calendar-latitude +39.54)
;(setq-default calendar-longitude +116.28)
;(setq-default calendar-location-name "北京")
(setq-default calendar-latitude +36.66)
(setq-default calendar-longitude +117.04)
(setq-default calendar-location-name "济南")

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq-default chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq-default chinese-calendar-terrestrial-branch
["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; 去掉不关心的节日，设定中国人在意的节日，在 calendar 上用 a 显示节日列表
;(setq holiday-christian-holidays nil)
(setq holiday-hebrew-holidays nil)
(setq holiday-islamic-holidays nil)
(setq holiday-solar-holidays nil)
(setq holiday-bahai-holidays nil)
(setq holiday-other-holidays
      '((holiday-fixed 3 14 "白色情人节")
	(holiday-fixed 5 1 "劳动节")
	(holiday-fixed 6 1 "儿童节")
;	(holiday-fixed 7 1 "建党节")
;	(holiday-fixed 8 1 "建军节")
	(holiday-fixed 9 10 "教师节")
	(holiday-fixed 10 1 "国庆节")
	(holiday-fixed 12 25 "圣诞节")))

;;  -------------------------------
;; | Section 0: Tools              |
;;  -------------------------------

;; epub
;; (load "~/.emacs.d/site-lisp/epub/epubmode.el")

;; sdcv
;; 还是有问题
;(load "~/.emacs.d/site-lisp/sdcv/sdcv-mode.el")
;(require 'sdcv-mode)
;(global-set-key (kbd "C-c d") 'sdcv-search)

;; (load "~/.emacs.d/site-lisp/sdcv/showtip.el")
;; (load "~/.emacs.d/site-lisp/sdcv/sdcv.el")
;; (require 'sdcv)
;; (setq-default sdcv-dictionary-simple-list        ;; a simple dictionary list
;;       '(
;; ;        "懒虫简明英汉词典"
;; ;        "懒虫简明汉英词典"
;; ;        "KDic11万英汉词典"
;; 	"朗道英汉字典5.0"
;;         ))
;; (setq-default sdcv-dictionary-complete-list      ;; a complete dictionary list
;;       '("KDic11万英汉词典"
;;         "懒虫简明英汉词典"
;;         "朗道英汉字典5.0"
;;         "XDICT英汉辞典"
;;         "朗道汉英字典5.0"
;;         "XDICT汉英辞典"
;;         "懒虫简明汉英词典"
;;         "牛津英汉双解美化版"
;;         "stardict1.3英汉辞典"
;;         "英汉汉英专业词典"
;;         "CDICT5英汉辞典"
;;         "Jargon"
;;         "FOLDOC"
;;         "WordNet"
;;         ))
;; (global-set-key (kbd "C-c d") 'sdcv-search-pointer+)
;; (global-set-key (kbd "C-c C-d") 'sdcv-search-input)

;; chrome Edit with Emacs
(add-to-list 'load-path "~/.emacs.d/site-lisp/chrome")
(require 'edit-server)
(edit-server-start)

;;browser
;(add-to-list 'load-path "~/.emacs.d/site-lisp/eww")
;(require 'eww)

;; make man page of all sections
(setq-default Man-switches "-a")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Rmail
(setq-default rmail-preserve-inbox t)
