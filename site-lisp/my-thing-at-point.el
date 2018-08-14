;;; my-thing-at-point.el --- things at point -*- coding: utf-8 -*-

(defun my-symbol-at-point ()
  (interactive)
  (thing-at-point 'symbol))

(defun my-list-at-point ()
  (interactive)
  (thing-at-point 'list))

(defun my-sexp-at-point ()
  (interactive)
  (thing-at-point 'sexp))

(defun my-defun-at-point ()
  (interactive)
  (thing-at-point 'defun))

(defun my-filename-at-point ()
  (interactive)
  (thing-at-point 'filename))

(defun my-url-at-point ()
  (interactive)
  (thing-at-point 'url))

(defun my-word-at-point ()
  (interactive)
  (thing-at-point 'word))

(defun my-sentence-at-point ()
  (interactive)
  (thing-at-point 'sentence))

(defun my-whitespace-at-point ()
  (interactive)
  (thing-at-poing 'whitespace))

(defun my-line-at-point ()
  (interactive)
  (thing-at-point 'line))

(defun my-page-at-point ()
  (interactive)
  (thing-at-point 'page))

(provide 'my-thing-at-point)
