(require 'package)

(when (eq window-system 'w32)
  (require 'proxy-mode)
  (setq proxy-mode-env-http-proxy "http://bjproxy2.cicc.group:8080")
  (setq proxy-mode-proxy-type 'env-http)
  (proxy-mode-enable-global))

;;; (require 'dash)

;; Add melpa to package repos
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-archives nil)
;; (add-to-list 'package-archives '("gnu"   . "http://elpa.emacs-china.org/gnu/") t)
;; (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
;; (setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/") t))

;; tsinghua melpa
;; (setq package-archives nil)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org" . "https://orgmode.org/elpa/")))


;; (setq package-pinned-packages '())

;; (package-initialize)
;; (when (string< emacs-version "27")
;;  (package-initialize))

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

;; (defun packages-install (packages)
;;   (--each packages
;;     (when (not (package-installed-p it))
;;       (package-install it)))
;;   (delete-other-windows))

(defun packages-install (packages)
  (dolist (it packages)
    (when (not (package-installed-p it))
      (package-install it)))
  (delete-other-windows))

;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(provide 'setup-package)
