;-*- coding: utf-8 -*-

;; global settings

;; PATH
(add-to-list 'exec-path "/usr/local/bin")

;; 解决Emacs执行shell命令command not found的问题, 原因是.bashrc修改的path变量未起作用
;; Emacs默认以非交互式执行shell命令, 不读取.bashrc, -i指定以交互式启动bash, -c表示命令读取来自字符串, 可以通过设置BASH_ENV来指定非交互式shell的配置文件
;; bash中, 执行bash脚本的时候，如果BASH_ENV被设置的话，它就会先执行BASH_ENV指向的脚本
;; 说明: .bash_profile is loaded for your login shell only. If you want to customize regular shells (such as xterm windows, or Emacs shells), you need to put the customization in .bashrc instead. Many people will source .bashrc from .bash_profile, so that you get all of your customizations in your login shell, but only those in .bashrc in your regular shells.
(setq-default shell-command-switch "-ic")
(setq-default current-language-environment "English")
(setq system-time-locale "en_US")

;; melpa
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/moe-theme-20151124.1509")
(add-to-list 'load-path "~/.emacs.d/elpa/moe-theme-20151124.1509")


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
;;   'default nil :font "Monaco 13")
;; ;  'default nil :font "Verdana-14")
;; ;; (if window-system 2
;; ;;    (set-fontset-font (frame-parameter nil 'font)
;; ;; 	  'unicode '("simsun" . "unicode-bmp")))	

;; ;(set-fontset-font
;; ;    (frame-parameter nil 'font)
;; ;    'han
;; ;    (font-spec :family "翩翩体-简" :size 14))
;; ;    (font-spec :family "手札体-简" :size 14))
;; ;    (font-spec :family "MingLiU" :size 16))
;; ;    (font-spec :family "冬青黑体简体中文" :size 12))

(if window-system
    (tool-bar-mode 0))
(scroll-bar-mode 0)
(set-fringe-mode '(0 . 0))


;;window numbering
(load-file "~/.emacs.d/site-lisp/window-numbering.el")
(require 'window-numbering)
(window-numbering-mode 1)
(defun select-window-next ()
  (interactive)
    (select-window-by-number
     (% (+ (window-numbering-get-number) 1) 10)))
(defun select-window-previous ()
  (interactive)
    (select-window-by-number
     (% (- (window-numbering-get-number) 1) 10)))

(define-key global-map (kbd "C-c n") 'select-window-next)  ;; similar of C-x o
(define-key global-map (kbd "C-c p") 'select-window-previous)


;; neotree
(add-to-list 'load-path "~/.emacs.d/site-lisp/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


(add-to-list 'default-frame-alist '(width  . 121))
(add-to-list 'default-frame-alist '(height  . 50))

;; txt结尾的文件的名字优先用中文编码显示
(modify-coding-system-alist 'file "\\.txt\\'" 'chinese-iso-8bit)

;; ;; eim输入法, 已merge搜狗输入法词库
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
;; (autoload 'eim-use-package "eim" "Another emacs input method")
;; (setq-default eim-use-tooltip nil)
;; (register-input-method
;;  "eim-py" "euc-cn" 'eim-use-package
;;   "拼音" "汉字拼音输入法" "py.txt")

;;  ----------------------------------
;; | Section II: Custom Org-mode GTD  |
;;  ----------------------------------

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; Org-mode global key setting
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)


;; add done time to org headlines,
;; if want to add notes, replace 'time with 'note
(setq-default org-log-done 'time)
;;(setq org-clock-continuously t)
;; to save the clock history across Emacs sessions.
(setq-default org-clock-persist 'history)
(org-clock-persistence-insinuate)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(cfs--current-profile-name "profile3" t)
 '(cfs--fontsize-steps (quote (3 4 5)) t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (moe-light)))
 '(custom-safe-themes
   (quote
    ("36d92f830c21797ce34896a4cf074ce25dbe0dabe77603876d1b42316530c99d" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "b809c70eeba09728804ebfbd16bf40f408c1dbe751b94330ff9e8d14a77b3370" "3625c04fa4b8a802e96922d2db3f48c9cb2f93526e1dc24ba0b400e4ee4ccd8a" "74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" "fe1682ca8f7a255cf295e76b0361438a21bb657d8846a05d9904872aa2fb86f2" "26ce7eea701bfd143ac536e6805224cff5598b75effb60f047878fe9c4833ae4" "8577da1641ed4bdf255341ca92e3d0e49c9f4d574458f09ce78159690442cade" "e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "1012cf33e0152751078e9529a915da52ec742dabf22143530e86451ae8378c1a" "9d7e517b49068e9fef941fe4083ad3d2a4b040895dca5175b84be48739689707" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "5999e12c8070b9090a2a1bbcd02ec28906e150bb2cdce5ace4f965c76cf30476" "badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" "519d1b3cb7345cc9be10b4b0489436ae2d1b0690470d8d78f8e4e1ff19b83a86" "5dd70fe6b64f3278d5b9ad3ff8f709b5e15cd153b0377d840c5281c352e8ccce" "12b7ed9b0e990f6d41827c343467d2a6c464094cbcc6d0844df32837b50655f9" "3d5307e5d6eb221ce17b0c952aa4cf65dbb3fa4a360e12a71e03aab78e0176c5" "f5eb916f6bd4e743206913e6f28051249de8ccfd070eae47b5bde31ee813d55f" default)))
 '(eval-expression-print-length nil)
 '(fci-rule-color "#3E3D31")
 '(helm-ag-base-command "ack --nocolor --nogroup")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3E3D31" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#3E3D31" . 100))))
 '(ledger-reports
   (quote
    (("2bal" "ledger -f %(ledger-file) -d \"l<=2\" bal")
     ("nbal" "ledger -f %(ledger-file) -n bal")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)")
     ("%" "ledger -f %(ledger-file) -%s -S T -d \"l<=2\" bal"))))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("~/org/officework.org" "~/org/emacs.org")))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(pyim-dicts
   (quote
    ((:name "BigDict-01" :file "/Users/cmal/.emacs.d/pyim/dicts/pyim-bigdict.pyim" :coding utf-8-unix :dict-type pinyin-dict))))
 '(sml/replacer-regexp-list
   (quote
    (("^~/org" ":Org:")
     ("^~/\\.emacs\\.d/elpa/" ":ELPA:")
     ("^~/\\.emacs\\.d/" ":ED:")
     ("^/sudo:.*:" ":SU:")
     ("^~/Documents/" ":Doc:")
     ("^~/Dropbox/" ":DB:")
     ("^:\\([^:]*\\):Documento?s/" ":\\1/Doc:")
     ("^~/[Gg]its/" ":Git:")
     ("^~/[Gg]it[Hh]ub/" ":Git:")
     ("^~/[Gg]it\\([Hh]ub\\|\\)-?[Pp]rojects/" ":Git:"))))
 '(tooltip-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(wakatime-api-key "21ede5a8-53df-4b2d-8666-24d89724a41b")
 '(wakatime-cli-path "/usr/local/bin/wakatime")
 '(weechat-color-list
   (unspecified "#272822" "#3E3D31" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(when
      (or
       (not
	(boundp
	 (quote ansi-term-color-vector)))
       (not
	(facep
	 (aref ansi-term-color-vector 0))))))

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
;(appt-activate t)

;; 更改org-clock-table时间显示
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

(load-file "~/.emacs.d/site-lisp/org-bullets.el")
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda() (org-bullets-mode)))

;; Show iCal calendars in the org agenda
;; org-mac-iCal will import events in all checked iCal.app
;; calendars for the date range org-mac-iCal-range months, centered
;; around the current date.
(when (require 'org-mac-iCal nil t)
  (setq org-agenda-include-diary t
        org-agenda-custom-commands
        '(("I" "Import diary from iCal" agenda ""
           ((org-agenda-mode-hook #'org-mac-iCal)))))

  (add-hook 'org-agenda-cleanup-fancy-diary-hook
            (lambda ()
              (goto-char (point-min))
              (save-excursion
                (while (re-search-forward "^[a-z]" nil t)
                  (goto-char (match-beginning 0))
                  (insert "0:00-24:00 ")))
              (while (re-search-forward "^ [a-z]" nil t)
                (goto-char (match-beginning 0))
                (save-excursion
                  (re-search-backward "^[0-9]+:[0-9]+-[0-9]+:[0-9]+ " nil t))
                (insert (match-string 0))))))


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
;(add-hook 'view-mode-hook (set-fringe-mode 0))

;; org mode 自动显示图片
;; iimage mode
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (iimage-mode))



;;  -------------------------
;; | Section IV: Shortcuts   |
;;  -------------------------

;; register this file name
;;(set-register ?i '(file . "~/.emacs.d/init.el"))

;; bookmark this file
;; already done

;;(setq default-input-method 'eim-py)
;;(set-input-method 'eim-py)


;; 中文计数
;; status bar 依次显示：
;; 字数,字符数不计空格,字符数计空格,非中文单词,中文字符和朝鲜语单词
(load-file "~/.emacs.d/word-like-count.el")
(require 'word-like-count-mode)
(global-set-key "\C-xw" 'word-like-count-mode)
(put 'narrow-to-region 'disabled nil)

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
;; (setq holiday-other-holidays
;;       '((holiday-fixed 3 14 "白色情人节")
;; 	(holiday-fixed 5 1 "劳动节")
;; 	(holiday-fixed 6 1 "儿童节")
;; ;	(holiday-fixed 7 1 "建党节")
;; ;	(holiday-fixed 8 1 "建军节")
;; 	(holiday-fixed 9 10 "教师节")
;; 	(holiday-fixed 10 1 "国庆节")
;; 	(holiday-fixed 12 25 "圣诞节")))

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

(global-set-key (kbd "C-c d") 'kid-sdcv-to-buffer)
(defun kid-sdcv-to-buffer ()
  (interactive)
  (let ((word (if mark-active
                  (buffer-substring-no-properties (region-beginning) (region-end))
                  (current-word nil t))))
    (setq word (read-string (format "Search the dictionary for (default %s): " word)
                            nil nil word))
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
                                        (unless (null (cdr (window-list))) ; only one window
                                          (delete-window)))))
           (goto-char (point-min))))))))

;; chrome Edit with Emacs
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/chrome")
;; (require 'edit-server)
;; (edit-server-start)

;;browser
;(add-to-list 'load-path "~/.emacs.d/site-lisp/eww")
;(require 'eww)

;; make man page of all sections
(setq-default Man-switches "-a")

;; Rmail
;; (setq-default rmail-preserve-inbox t)
;; (put 'narrow-to-region 'disabled nil)

;;  -------------------------------
;; | Section V: Publishing         |
;;  -------------------------------

;; (setq org-publish-project-alist
;;       '(("org-cmal"
;; 	 ;; Path to your org files
;; 	 :base-directory "~/cmal.github.io/org/"
;; 	 :base-extension "org"

;; 	 ;; Path to your Jekyll project
;; 	 :publishing-directory "~/cmal.github.io/_posts/"
;; 	 :recursive t
;; 	 ;; this is for org-mode pre-version 8
;; 	 :publishing-function org-publish-org-to-html
;; 	 ;; this is for org-mode version 8 and on
;; 	 ;;:publishing-function org-html-publish-to-html
;; 	 :headline-levels 4
;; 	 :html-extension "html"
;; 	 :body-only t ;; Only export section between <body> </body>
;; 	 )
;; 	("org-static-cmal"
;; 	 :base-directory "~/cmal.github.io/org/"
;; 	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
;; 	 :publishing-directory "~cmal.github.io/assets/"
;; 	 :recursive t
;; 	 :publishing-function org-publish-attachment)
;; 	("github" :components ("org-cmal" "org-static-cmal"))))
	 

;; cfs 中文字体 org
(require 'chinese-fonts-setup)

(require 'chinese-pyim)
(setq default-input-method "chinese-pyim")
(global-set-key (kbd "C-\\") 'toggle-input-method)
(global-set-key (kbd "C-;") 'pyim-toggle-full-width-punctuation)


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


(load-file "~/.emacs.d/site-lisp/web-mode.el")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))


(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tooltip ((t (:inherit variable-pitch :background "lightyellow" :foreground "black" :height 2.0)))))


(autoload 'ledger-mode "ledger-mode" "A major mode for Ledger" t)
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

(global-anzu-mode 1)

(display-time-mode 1)


(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; helm-swoop
;;(require 'helm-swoop)
(define-key global-map (kbd "C-S-w") 'helm-swoop)



(show-paren-mode t)

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; helm-xcdoc
;; to search document
;; M-x helm-xcdoc-search
;; M-x helm-xcdoc-search-other-window
;; (require 'helm-xcdoc)
;; (setq helm-xcdoc-command-path "/Applications/Xcode.app/Contents/Developer/usr/bin/docsetutil")
;; (setq helm-xcdoc-document-path "~/Library/Developer/Shared/Documentation/DocSets/com.apple.adc.documentation.AppleiOS8.1.iOSLibrary.docset")

;; MarkDown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; cursor-chg
;;(require 'cursor-chg)
;;(change-cursor-mode 1)
;;(toggle-cursor-type-when-idle 1)

;; on-screen, highlight when scroll
;(require 'on-screen)
;(on-screen-global-mode +1)


;; helm-ag, search with helm

;; fcitx-remote-os-x --with-input-method=sogou-pinyin
(load-file "~/.emacs.d/site-lisp/fcitx.el")
(require 'fcitx)

;;(require 'highlight-current-line)
;;(highlight-current-line-on t)

;;golden-ratio-scroll-screen
(require 'golden-ratio-scroll-screen)
(global-set-key [remap scroll-down-command] 'golden-ratio-scroll-screen-down)
(global-set-key [remap scroll-up-command] 'golden-ratio-scroll-screen-up)

;;(require 'diredful)
;;(diredful-mode 1)

(require 'dash)
(require 'blog-admin)
;; (setq blog-admin-backend-path "~/gits/blog")
;; (setq blog-admin-backend-type 'hexo)
;; (setq blog-admin-backend-new-post-in-drafts t) ;; create new post in drafts by default
;; (setq blog-admin-backend-new-post-with-same-name-dir t) ;; create same-name directory with new post
(setq blog-admin-backend-type 'org-page)
(setq blog-admin-backend-path "~/gits/op-blog")
(setq blog-admin-backend-new-post-in-drafts t)
(setq blog-admin-backend-new-post-with-same-name-dir t)
(setq blog-admin-backend-org-page-drafts "_drafts")


(eval-after-load 'org '(require 'org-pdfview))

(require 'org-page)
(setq op/repository-directory "~/gits/op-blog")
(setq op/site-domain "http://localhost:8080")
;;; for commenting, you can choose either disqus or duoshuo
(setq op/personal-disqus-shortname "zyzy5730")
;(setq op/personal-duoshuo-shortname "cmal")
;;; the configuration below are optional
;;(setq op/personal-google-analytics-id "your_google_analytics_id")

(setq op/site-main-title "M-x psychotherapist")
(setq op/site-sub-title "cmal@bitbucket.org")
(setq op/personal-github-link "https://github.com/cmal")
;; (setq op/category-config-alist
;;       (cons '("None" category name goes here to disable commenting
;; 	      :show-comment nil)
;; 	    op/category-config-alist))

;;(require 'org-alert)
;;(org-alert-enable)
(require 'rainbow-mode)
(rainbow-mode 1)

(sml/setup)
;(sml/apply-theme "light-powerline")
;; (diredful-add CFG-FILE-NAME)

(require 'ace-pinyin)
(ace-pinyin-global-mode 1)
(define-key global-map (kbd "C-c C-SPC") 'ace-pinyin-jump-char)

(require 'key-chord)
(key-chord-define-global "vj" 'mc/edit-lines)
(key-chord-define-global "gd" 'mc/mark-all-symbols-like-this)
(key-chord-define-global "gg" 'mc/mark-next-like-this-symbol)
(key-chord-define-global "gp" 'mark/previous-symbol-like-this)
(key-chord-mode +1)

;; pinyin-search
(define-key global-map (kbd "C-S-s") 'pinyin-search)
(define-key global-map (kbd "C-S-r") 'pinyin-search-backward)

(require 'ace-jump-buffer)
(define-key global-map (kbd "C-x C-b") 'ace-jump-buffer)

;;showkey
;(autoload 'showkey-log-mode "showkey-log-mode")

;; osx-location
(require 'osx-location)
(eval-after-load 'osx-location
  '(when (eq system-type 'darwin)
     (add-hook 'osx-location-changed-hook
               (lambda ()
                 (setq calendar-latitude osx-location-latitude
                       calendar-longitude osx-location-longitude
                       calendar-location-name (format "%s, %s" osx-location-latitude osx-location-longitude))))))
(osx-location-watch)
;; theme-changer, use calendar and latitude/longitude
(require 'theme-changer)
(change-theme 'moe-light 'moe-dark)

;; visible-mark
(require 'visible-mark)
(global-visible-mark-mode 1)
 ;; or add (visible-mark-mode) to specific hooks
(setq visible-mark-max 3)

;; make Emacs transparent
;;(require 'seethru)
;;(seethru 100)

(require 'wakatime-mode)
(global-wakatime-mode)
(setq wakatime-api-key "21ede5a8-53df-4b2d-8666-24d89724a41b")
(setq wakatime-cli-path "/usr/local/Cellar/wakatime-cli/4.0.14/libexec/lib/python2.7/site-packages/wakatime/cli.py")

(require 'volatile-highlights)
(volatile-highlights-mode t)

(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)

(require 'calfw)
(require 'calfw-org)
(define-key global-map (kbd "C-c i") 'cfw:open-org-calendar)
(setq cfw:org-overwrite-default-keybinding t)
(setq calendar-week-start-day 1)

(load-file "~/.emacs.d/site-lisp/calfw-git.el")
(require 'calfw-git)
(define-key global-map (kbd "C-c g") 'cfw:git-open-calendar)

(require 'fic-mode)
(fic-mode 1)

(require 'fancy-narrow)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
;(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-h"))
(guide-key-mode 1)
(setq guide-key/highlight-command-regexp
      '("rectangle"
        ("register" . font-lock-type-face)
        ("bookmark" . "hot pink")))
(require 'guide-key-tip)
(setq guide-key-tip/enabled t)

(require 'emojify)
;; In programming modes only emojis in string and comments are displayed.
;(add-hook 'after-init-hook #'global-emojify-mode)  #bug
;; (require 'emoji-cheat-sheet-plus)
;; to create a cheatsheet buffer, use:
;; M-x emoji-cheat-sheet-plus-buffer
;; enabled emoji in buffer
(add-hook 'org-mode-hook 'emoji-cheat-sheet-plus-display-mode)
(add-hook 'org-mode-hook 'emojify-mode)
;; insert emoji with helm
(global-set-key (kbd "M-S-e") 'emoji-cheat-sheet-plus-insert)

;;(global-subword-mode) ;default
;;(global-superword-mode)

(encourage-mode)

;; nav, use M-x nav to start
(require 'nav)
(nav-disable-overeager-window-splitting)

(require 'diff-hl)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)


;;(require 'lispy)

(require 'elfeed)
(require 'elfeed-goodies)
(elfeed-goodies/setup)
(require 'elfeed-org)
;; Initialize elfeed-org
;; This hooks up elfeed-org to read the configuration when elfeed
;; is started with =M-x elfeed=
(elfeed-org)
;; Optionally specify a number of files containing elfeed
;; configuration. If not set then the location below is used.
;; Note: The customize interface is also supported.
(setq rmh-elfeed-org-files (list "~/org/elfeed.org"))

;; other window operations
(require 'owdriver)
(global-unset-key (kbd "M-o"))
(setq owdriver-prefix-key "M-o")
(owdriver-config-default)
(owdriver-mode 1)
;(global-set-key (kbd "M-h") 'owdriver-do-scroll-right)
;(global-set-key (kbd "M-j") 'owdriver-do-scroll-up)
;(global-set-key (kbd "C-M-v") 'owdriver-do-scroll-down)
(global-set-key (kbd "C-M-S-v") 'owdriver-do-scroll-left)
(global-set-key (kbd "M-s M-s") 'owdriver-do-isearch-forward)

;; (require 'org-tracktable)
;; org-tracktable-status
;; org-tracktable-write
;; (setq org-tracktable-table-name "my-table-name")
;; org-tracktable-insert-table

;(require 'bbdb-china)

(load-file "~/.emacs.d/pinyin-before-point.el")
(require 'pinyin-before-point)
(global-set-key (kbd "C-6") 'convert-pinyin-before-point)
