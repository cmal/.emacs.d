(require 'package)
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
;;                         ("org" . "https://orgmode.org/elpa/")
))

;; (setq package-pinned-packages '())

(when (string< emacs-version "27")
 (package-initialize))

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

(provide 'setup-package)
