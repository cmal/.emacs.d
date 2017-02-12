(require 'jedi)
(require 'jedi-direx)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; jedi-direx
(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
(add-hook 'jedi-mode-hook 'jedi-direx:setup)

;; may add emacs-ipython-notebook in future

(provide 'setup-python)
