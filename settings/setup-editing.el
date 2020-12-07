;; setup-editing
(setq-default delete-by-moving-to-trash t)

;; fill-region
(global-set-key (kbd "C-M-=") 'fill-region)

;; Move to trash when deleting stuff
(when mac-p 
  (setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs"))

(global-set-key (kbd "s-p") 'scroll-down-line)
(global-set-key (kbd "s-n") 'scroll-up-line)
(when mac-p
  (global-set-key (kbd "M-s-~") (lambda ()
                                  (interactive)
                                  (scroll-other-window -1)))
  (global-set-key (kbd "M-s-π") (lambda ()
                                  (interactive)
                                  (scroll-other-window 1))))

;; mouse scroll one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(setq-default scroll-margin 2)

(setq large-file-warning-threshold 2000000)

;; (global-set-key (kbd "C-c s") 'replace-string)
;; visual-regexp
;; (require 'visual-regexp)
;; (define-key global-map (kbd "M-&") 'vr/query-replace)
;; (define-key global-map (kbd "C-c s") 'vr/query-replace)
(use-package visual-regexp
  :config
  (define-key global-map (kbd "M-%") 'vr/query-replace)
  (define-key global-map (kbd "C-c s") 'vr/replace))
;; (define-key global-map (kbd "M-/") 'vr/replace)

(use-package multiple-cursors
  :config
  (define-key global-map (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (define-key global-map (kbd "C-s-.") 'mc/mark-next-like-this)
  (define-key global-map (kbd "C-s-,") 'mc/mark-previous-like-this)
  (define-key global-map (kbd "C-c C-<") 'mc/mark-all-like-this)
  (define-key global-map (kbd "<s-mouse-1>") 'mc/add-cursor-on-click))

(require 'smart-forward)

;; (require 'golden-ratio-scroll-screen)
;; (define-key global-map [remap scroll-down-command] 'golden-ratio-scroll-screen-down)
;; (define-key global-map [remap scroll-up-command] 'golden-ratio-scroll-screen-up)

 ;; highlight: FIXME TODO BUG (...)
(use-package fic-mode
  :demand t
  :hook
  (prog-mode . fic-mode)
  :config
  (add-to-list 'fic-highlighted-words "NOTE"))

;; auto indent
(defun set-newline-and-indent ()
;;  (local-set-key (kbd "RET") 'newline-and-indent))
  (local-set-key (kbd "RET") 'electric-newline-and-maybe-indent))
;; use electric-indent-mode because aggressive-indent-mode has performance problems
(electric-indent-mode)

;; (add-hook 'prog-mode-hook 'set-newline-and-indent)
;; (remove-hook 'prog-mode-hook 'set-newline-and-indent)
(add-hook 'prog-mode-hook 'linum-mode)

;; %H -> %I to make it display 12hr hours
;; (setq-default display-time-format "%H:%M:%S %Y/%m/%d")
;; caution: maybe the next line will slow down your Emacs,
;; set it to 60 or more if this happens.
;; (setq-default display-time-interval 1)
;; (display-time-mode 1)
;; (display-time)                   ;; activate time display


(use-package visual-fill-column
  :hook
  ;; (add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
  (visual-fill-column-mode . visual-line-mode)
  :demand t
  :config
  (global-visual-line-mode 1))

;; move-text
;; (move-text-default-bindings) ;; this is in move-text package
(use-package move-text ;; this uses site-lisp/move-text.el
  :bind
  (:map global-map
        ("s-<up>" . move-text-up)
        ("s-<down>" . move-text-down)))

;; comment code
(defun toggle-comment ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive "*")
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(define-key global-map (kbd "M-;") 'toggle-comment)

(global-whitespace-cleanup-mode)

(set-default 'truncate-lines t)

(use-package smartscan
  :config
  (global-smartscan-mode))

;; mic-paren
;; (paren-activate)

(use-package expand-region
  :config
  (define-key global-map (kbd "C-=") 'er/expand-region)
  (define-key global-map (kbd "M-j") 'join-line)
  (define-key global-map (kbd "s-t") 'transpose-paragraphs)
  (define-key global-map (kbd "s-[") 'backward-paragraph)
  (define-key global-map (kbd "s-]") 'forward-paragraph))

;; ;; auto-jump-mode
;; (autoload
;;   'ace-jump-mode-pop-mark
;;   "ace-jump-mode"
;;   "Ace jump back:-)"
;;   t)
;; (eval-after-load "ace-jump-mode"
;;   '(ace-jump-mode-enable-mark-sync))
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; (define-key global-map (kbd "C-c C-/") 'ace-jump-mode-pop-mark)

(use-package pinyin-search)

;;If you use viper mode :
;; (define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
;; (define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(use-package editorconfig
  :config
  (editorconfig-mode 1)
  (require 'setup-diminish)
  (diminish 'editorconfig-mode "EC"))

;; abbrev-mode
(use-package abbrev
  :config
  (setq abbrev-file-name "~/.emacs.d/abbrev-defs.el")
  (setq save-abbrevs t)
  (setq-default abbrev-mode t)
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file))
  (setq default-abbrev-mode t))

;; (add-hook 'ledger-mode-hook (lambda () (abbrev-mode 1)))

;; a defined kbd macro
;; use for change clojure hashmap to a 2 column csv format
(fset 'hashmap-to-csv
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([4 134217790 backspace 134217788 134217848 114 101 112 108 97 99 101 45 115 116 114 105 110 103 return 44 32 return 17 10 return 134217788 134217848 114 101 112 108 97 99 101 45 115 116 114 105 110 103 return 58 return 39 return 134217788 134217848 114 101 112 108 97 99 101 45 115 116 114 105 110 103 return 32 return 44 return] 0 "%d")) arg)))

;; input method
(use-package chinese-wubi
  :config
  (register-input-method "chinese-wubi" "Chinese-GB" 'quail-use-package "WB" "汉字输入∷五笔输入法∷")
  (setq default-input-method "chinese-wubi"))
;; (toggle-input-method)

;; (when mac-p
;;  ;; setup swbuff-mode
;;  ;; requiring swbuff-x
;;  (setq swbuff-exclude-mode-regexp
;;        "helm\\|magit\\|fundamental\\|diff\\|nodejs\\|help\\|message\\|org\\|text")
;;  (setq swbuff-start-with-current-centered t)
;;  (setq swbuff-display-intermediate-buffers t)
;;  (setq swbuff-clear-delay 2)
;;  ;;(setq swbuff-window-min-text-height 2)
;;  )


;; integrating iTerm2
(defun get-file-dir-or-home ()
  "If inside a file buffer, return the directory, else return home"
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
	"~/"
      (file-name-directory filename))))

(defun iterm2-goto-filedir ()
  "Go to present working dir and focus iterm,
if not on a file, goto HOME dir."
  (interactive)
  (do-applescript
   (concat
    " tell application \"iTerm2\"\n"
    "   tell the current session of current window\n"
    (format "     write text \"cd %s\" \n"
            ;; string escaping madness for applescript
            (replace-regexp-in-string "\\\\" "\\\\\\\\"
                                      (shell-quote-argument (or default-directory "~"))))
    "   end tell\n"
    " end tell\n"
    " do shell script \"open -a iTerm\"\n")))
(define-key global-map (kbd "s-G") 'iterm2-goto-filedir)

;; (defun iterm-focus ()
;;   (interactive)
;;   (do-applescript
;;    " do shell script \"open -a iTerm\"\n"))
;; (define-key global-map (kbd "s-<escape>") 'iterm-focus)


;; add time to function `message`

;; (defun sh/current-time-microseconds ()
;;   "Return the current time formatted to include microseconds."
;;   (let* ((nowtime (current-time))
;;          (now-ms (nth 2 nowtime)))
;;     (concat (format-time-string
;;              "[%Y-%m-%dT%T"
;;              nowtime)
;;             (format
;;              ".%d]"
;;              now-ms))))

;; not working well, maybe using log4e
;; (defun my-current-time-microseconds ()
;;   "Return the current time formatted to include microseconds."
;;   (let* ((nowtime (current-time)))
;;     (format-time-string "[%Y-%m-%dT%T]" nowtime)))

;; (defun my-ad-timestamp-message (FORMAT-STRING &rest args)
;;   "Advice to run before `message' that prepends a timestamp to each message.
;; Activate this advice with: (advice-add 'message :before 'my-ad-timestamp-message)"
;;   (unless (string-equal FORMAT-STRING "%s%s")
;;     (let ((deactivate-mark nil)
;;           (inhibit-read-only t))
;;       (with-current-buffer "*Messages*"
;;         (goto-char (point-max))
;;         (if (not (bolp)) (newline))
;;         (insert (my-current-time-microseconds) " ")))))

;; (advice-add 'message :after #'my-ad-timestamp-message)
;; ;; (advice-remove 'message #'my-ad-timestamp-message)


(use-package log4j-mode
  :mode "\\.log$")

;; buffer-flip
(require 'buffer-flip)
(define-key global-map (kbd "M-<tab>") 'buffer-flip)
(setq buffer-flip-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "M-<tab>")   'buffer-flip-forward) 
        (define-key map (kbd "M-S-<tab>") 'buffer-flip-backward)
        (define-key map (kbd "C-g")     'buffer-flip-abort)
        map))

(setq buffer-flip-skip-patterns 
      '(
        ;;"^\\*helm\\b"
        ;;"^\\*swiper\\*$"
        ;;"^\\*magit.*"
        "^\\*.*"
        "^#.*#$"))

;; for whitespace-mode, usually useful for `makefile-bsdmake-mode'
(setq whitespace-style '(face tabs))
(modify-face whitespace-tab nil "#F92672")

;; override a smartscan function
;; change `error' -> `message'
;; because error is boring.
(defun smartscan-symbol-at-pt (&optional dir)
  "Returns the symbol at point and moves point to DIR (either `beginning' or `end') of the symbol.

If `smartscan-use-extended-syntax' is t then that symbol is returned
instead."
  ;; we need a quick-and-dirty syntax table hack here to make
  ;; `thing-at-point' pick up on the fact that '.', '_', etc. are all
  ;; part of a single expression.
  (smartscan-with-symbol
    ;; grab the word and return it
    (let ((word (thing-at-point (intern smartscan-symbol-selector)))
          (bounds (bounds-of-thing-at-point (intern smartscan-symbol-selector))))
      (if word
          (progn
            (cond
             ((eq dir 'beginning) (goto-char (car bounds)))
             ((eq dir 'end) (goto-char (cdr bounds)))
             (t (progn
                  (user-error "Invalid direction"))))
            word)
        (progn
          (user-error "No symbol found"))))))

;; show function name in mode line
;; which-function-mode
;; (which-func-mode nil)
(which-function-mode t)

(setq mode-line-format
      (delete (assoc 'which-func-mode mode-line-format)
              mode-line-format)
      which-func-header-line-format
      '(which-func-mode ("" which-func-format)))

(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (setq mode-line-format (delete (assoc 'which-func-mode
                                          mode-line-format) mode-line-format)
          header-line-format which-func-header-line-format)))


(require 'my-thing-at-point)

;; "C-\\" has already bound to delete-horizontal-whitespace
;; bound "C-c \\" to fixup-whitespace
(define-key global-map (kbd "C-c \\") 'fixup-whitespace)

;; ============ ace-window ===============

(use-package ace-window
  :demand t
  :bind
  (:map global-map
   ("C-x o" . ace-window)
;;   ("C-x 1" . ace-delete-other-windows)
   ("C-x w" . ace-swap-window)
   ("C->" . ace-swap-window)
   ("C-<" . aw-flip-window))
  :config
  (setq aw-keys '(?s ?d ?f ?j ?k ?l ?g ?h ?n))
  (ace-window-display-mode t)
  (setq aw-dispatch-always nil))

;; ============ ace-window ===============

;; https://emacs.stackexchange.com/questions/964/show-unbound-keys
;; (require 'bind-key) ;; TODO: make me working
(use-package free-keys)
;; (require 'guide-key)
;; M-x describe-personal-keybindings

(use-package wgrep)

(use-package git-timemachine
  :ensure t
  :bind (:map global-map
              ("C-M-m" . git-timemachine)))

(define-key global-map (kbd "C-x e") 'eval-replace-last-sexp)

;; query-replace with textual transformation
;; refer to this question:
;; https://stackoverflow.com/questions/57751/emacs-query-replace-with-textual-transformation
;; http://steve-yegge.blogspot.com/2006/06/shiny-and-new-emacs-22.html
;; http://steve-yegge.blogspot.com/
;; M-x replace-regexp
;; Replace regexp:  \(\w+\)
;; Replace regexp with:  \,(capitalize \1)

(defun double-px (px)
  ;; css mode always need to transform px in 375 to 750,
  ;; so we often want to replace, say 12px, to 24px.
  ;; If s is end with px
  (number-to-string (* 2 (string-to-number px))))
;; (double-px "33")
(defun double-pxs (start end)
  (interactive "r")
  (goto-char start)
  (let ((cnt 0))
    (while (re-search-forward "\\([0-9]+\\)px" end t)
      ;; (replace-regexp-in-string "\\(foo\\).*\\'" "bar" "1foofoo" nil nil 1)
      (setq cnt (1+ cnt))
      (replace-match
       (concat (replace-regexp-in-string ".*" (lambda (x) (double-px x)) (match-string 1)) "px")))
    (message (concat "replaced " (number-to-string cnt) " places."))))
;; or manually:
;; M-x replace-regexp
;; \([0-9]+\)px
;; \,(double-px \1)px

(use-package helm-git-grep
  :ensure t
  :demand t)

;; https://codestats.net/users/cmal
(comment
 (use-package code-stats
   :ensure t
   :config
   (setq code-stats-token "SFMyNTY.WTIxaGJBPT0jI01UQXhPRE09.mNPo6ReF_5n32WW-E8_M7Wp84zlF5V8G1OP6DqayH8M")
   (add-hook 'prog-mode-hook #'code-stats-mode)
   (run-with-idle-timer 30 t #'code-stats-sync)
   (add-hook 'kill-emacs-hook (lambda () (code-stats-sync :wait)))))

(goto-address-mode 1)

(use-package awesome-pair
  :demand t
  :hook
  (c-mode-common-hook . awesome-pair-mode)
  (c-mode-hook . awesome-pair-mode)
  (c++-mode-hook . awesome-pair-mode)
  (java-mode-hook . awesome-pair-mode)
  (haskell-mode-hook . awesome-pair-mode)
  (emacs-lisp-mode-hook . awesome-pair-mode)
  (lisp-interaction-mode-hook . awesome-pair-mode)
  (lisp-mode-hook . awesome-pair-mode)
  (maxima-mode-hook . awesome-pair-mode)
  (ielm-mode-hook . awesome-pair-mode)
  (sh-mode-hook . awesome-pair-mode)
  (makefile-gmake-mode-hook . awesome-pair-mode)
  (php-mode-hook . awesome-pair-mode)
  (python-mode-hook . awesome-pair-mode)
  (js-mode-hook . awesome-pair-mode)
  (web-mode-hook . awesome-pair-mode)
  (rjsx-mode-hook . awesome-pair-mode)
  (go-mode-hook . awesome-pair-mode)
  (qml-mode-hook . awesome-pair-mode)
  (jade-mode-hook . awesome-pair-mode)
  (css-mode-hook . awesome-pair-mode)
  (ruby-mode-hook . awesome-pair-mode)
  (coffee-mode-hook . awesome-pair-mode)
  (rust-mode-hook . awesome-pair-mode)
  (qmake-mode-hook . awesome-pair-mode)
  (lua-mode-hook . awesome-pair-mode)
  (swift-mode-hook . awesome-pair-mode)
  (minibuffer-inactive-mode-hook . awesome-pair-mode)
  :bind 
  (:map awesome-pair-mode-map
        ("(" . awesome-pair-open-round)
        ("[" . awesome-pair-open-bracket)
        ("{" . awesome-pair-open-curly)
        (")" . awesome-pair-close-round)
        ("]" . awesome-pair-close-bracket)
        ("}" . awesome-pair-close-curly)
        ("=" . awesome-pair-equal)
        ("%" . awesome-pair-match-paren)
        ("\"" . awesome-pair-double-quote)
        ("SPC" . awesome-pair-space)
        ("M-o" . awesome-pair-backward-delete)
        ("C-d" . awesome-pair-forward-delete)
        ("C-k" . awesome-pair-kill)
        ("M-\"" . awesome-pair-wrap-double-quote)
        ("M-[" . awesome-pair-wrap-bracket)
        ("M-{" . awesome-pair-wrap-curly)
        ("M-(" . awesome-pair-wrap-round)
        ("M-)" . awesome-pair-unwrap)
        ("M-p" . awesome-pair-jump-right)
        ("M-n" . awesome-pair-jump-left)
        ("M-:" . awesome-pair-jump-out-pair-and-newline)))

(use-package insert-translated-name
  :bind
  (:map global-map
        ("C-M-i" . insert-translated-name-replace)))

(defun open-newline-above (arg)
  "Move to the previous line (like vi) and then opens a line."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (if (not (member major-mode '(haskell-mode org-mode literate-haskell-mode)))
      (indent-according-to-mode)
    (beginning-of-line)))

(defun open-newline-below (arg)
  "Move to the next line (like vi) and then opens a line."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (call-interactively 'next-line arg)
  (if (not (member major-mode '(haskell-mode org-mode literate-haskell-mode)))
      (indent-according-to-mode)
    (beginning-of-line)))

(global-set-key (kbd "C-M-o") 'open-newline-below)
(global-set-key (kbd "C-s-<backspace>") 'kill-whole-line)

(setq-default python-indent 2)

(add-hook 'prog-mode 'annotate-mode)

(provide 'setup-editing)
