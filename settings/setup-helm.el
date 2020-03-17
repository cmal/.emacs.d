;; helm from https://github.com/emacs-helm/helm

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; helm-swoop
;;(require 'helm-swoop)
;;(define-key global-map (kbd "C-S-w") 'helm-swoop)
;; rifle

;; project find word
;; (helm-projectile-on)
;; (global-set-key (kbd "C-x M-f") 'helm-projectile-grep)

;; and this one find those git registered files
(global-set-key (kbd "C-x f") 'helm-ls-git-ls)

(require 'swiper-helm)
(global-set-key (kbd "C-c w") 'swiper)
(require 'wgrep-helm)

;; ;; below this are all helm-swoop settings ...
;; (require 'helm-swoop)

;; ;; Change the keybinds to whatever you like :)
;; (global-set-key (kbd "M-i") 'helm-swoop)
;; (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
;; (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
;; (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; ;; When doing isearch, hand the word over to helm-swoop
;; (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; ;; From helm-swoop to helm-multi-swoop-all
;; (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; ;; When doing evil-search, hand the word over to helm-swoop
;; ;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

;; ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
;; ;; (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

;; ;; Move up and down like isearch
;; (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
;; (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
;; (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
;; (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

;; ;; Save buffer when helm-multi-swoop-edit complete
;; (setq helm-multi-swoop-edit-save t)

;; ;; If this value is t, split window inside the current window
;; (setq helm-swoop-split-with-multiple-windows nil)

;; ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
;; (setq helm-swoop-split-direction 'split-window-horizontally)

;; ;; If nil, you can slightly boost invoke speed in exchange for text color
;; (setq helm-swoop-speed-or-color nil)

;; ;; ;; Go to the opposite side of line from the end or beginning of line
;; (setq helm-swoop-move-to-line-cycle t)

;; ;; Optional face for line numbers
;; ;; Face name is `helm-swoop-line-number-face`
;; (setq helm-swoop-use-line-number-face t)

;; ;; If you prefer fuzzy matching
;; (setq helm-swoop-use-fuzzy-match t)

(helm-descbinds-mode)

(require 'helm-emmet)

(require 'helm-github-stars)
;; Setup your github username:
(setq helm-github-stars-username "cmal")

;; https://emacs.stackexchange.com/questions/50416/can-helm-ag-commands-ignore-git-submodules/50426#50426
(require 'helm-ag)
(setq helm-ag-use-grep-ignore-list t)
;; adding a .agignore (or .ignore if you use ag 2.0.0) to the root of
;; your project with a list of folders that you want to ignore.
(global-set-key (kbd "C-x a g") 'helm-ag)

(provide 'setup-helm)
;;; setup-helm.el ends here
