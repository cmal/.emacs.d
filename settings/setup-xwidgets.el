;;; https://github.com/veshboo/emacs

(setq browse-url-browser-function 'xwidget-webkit-browse-url)
;; (browse-url "https://www.baidu.com")

(require 'search-web)
(global-set-key (kbd "C-c w") 'search-web)
(defun browse-url-default-browser (url &rest args)
  "Override `browse-url-default-browser' to use `xwidget-webkit' URL ARGS."
  (xwidget-webkit-browse-url url args))

(defvar xwidget-webkit-bookmark-jump-new-session) ;; xwidget.el
(defvar xwidget-webkit-last-session-buffer) ;; xwidget.el
(add-hook 'pre-command-hook
          (lambda ()
            (if (eq this-command #'bookmark-bmenu-list)
                (if (not (eq major-mode 'xwidget-webkit-mode))
                    (setq xwidget-webkit-bookmark-jump-new-session t)
                  (setq xwidget-webkit-bookmark-jump-new-session nil)
                  (setq xwidget-webkit-last-session-buffer (current-buffer))))))

(add-hook 'xwidget-webkit-mode-hook
          (lambda ()
            (xwidget-webkit-zoom-out)))
(provide 'setup-xwidgets)
