;;; eslpod-emms-mode.el --- eslpod-emms-minor-mode -*- lexical-binding: t; -*-

(require 'emms)
(require 'emms-setup)

;; for debug
;; (unload-feature 'emms)
;; (unload-feature 'emms-setup)

;; (emms-minimalistic)
;; (emms-all)


(require 'emms-source-file)
(require 'emms-source-playlist)
(require 'emms-player-simple)
(require 'emms-player-mpv)

;; (setq emms-info-asynchronously nil)

;; setup emms-default-players

;; (emms-standard)
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq emms-player-list '(emms-player-mpv))

(require 'f)
(require 's)
(setq eslpod-path "~/Music/eslpod/ESLPod Courses/")
(setq emms-source-file-default-directory eslpod-path)
;; (emms-add-directory-tree eslpod-path)
;;(emms-playlist-mode-go)

(defun initial-track-time-mark ()
  (require 'emms-playing-time)
  (emms-playing-time-start)
  (emms-playing-time-set 0)
  (setq eslpod-track-time-mark 0))

(defun eslpod-initialize ()
  (setq eslpod-index 0) ;; initialize
  (setq emms-repeat-track t)
  (initial-track-time-mark))

(defun eslpod-toggle-repeat ()
  (interactive)
  (setq emms-repeat-track (not emms-repeat-track)))

(defun eslpod-set-current-file (index)
  (setq eslpod-current-file
        (nth index
             (seq-filter
              (lambda (f) (s-suffix? ".mp3" f))
              (f--collect-entries "~/Music/eslpod/ESLPod Courses/" t)))))

;; add one file to playlist
;; (emms-add-file eslpod-current-file)

(defun eslpod-play-current-file ()
  (emms-play-file eslpod-current-file)
  (initial-track-time-mark))

(defun eslpod-restart-track ()
  (interactive)
  (eslpod-play-current-file))

(defun eslpod-forward-track ()
  (interactive)
  (setq elspod-index (1+ eslpod-index))
  (eslpod-set-current-file elspod-index)
  (eslpod-play-current-file))

(defun eslpod-backward-track ()
  (interactive)
  (setq elspod-index (1- eslpod-index))
  (eslpod-set-current-file elspod-index)
  (eslpod-play-current-file))


(defun eslpod-current-track-desc ()
  (emms-track-description
   (emms-playlist-current-selected-track)))

(defun eslpod-insert-current-track-desc ()
  (interactive)
  (insert (format "[[file://%s]]\n\t%s"
                  (eslpod-current-track-desc)
                  (eslpod-format-track-length))))

(defun eslpod-show ()
  ;; stolen from emms-show
  (interactive)
  (let* ((eslpod-show-format (concat emms-show-format ", current index: %d"))
         (string (if emms-player-playing-p
                     (format eslpod-show-format
                             (eslpod-current-track-desc)
                             eslpod-index)
                   (format "Nothing playing right now. current index: %d" eslpod-index))))
    (message "%s" string)))

;; (require 'stream)
;; functions defined in seq.el can use stream as input

;; directory-files-recursively
;; directory-files

(defun eslpod-current-track-length ()
  (emms-track-get
   (emms-playlist-current-selected-track)
   'info-playing-time))

(defun eslpod-get-track-current-time ()
  (mod emms-playing-time (eslpod-current-track-length)))

(defun eslpod-format-track-length ()
  (format "track length: %d seconds" (eslpod-current-track-length)))

(defun eslpod-seek-forward ()
  (interactive)
  (let ((seconds 5))
    (emms-player-seek seconds)))

(defun eslpod-seek-backward ()
  (interactive)
  (let ((seconds -5))
    (emms-player-seek seconds)))

(defun eslpod-seek-to (seconds)
  (interactive)
  (emms-player-seek-to seconds))

(defun eslpod-restart-track ()
  (interactive)
  (emms-player-seek-to 0))

(defun eslpod-set-mark ()
  (interactive)
  (setq eslpod-track-time-mark (eslpod-get-track-current-time))
  (message "eslpod-track-time-mark set to %d" eslpod-track-time-mark))

(defun eslpod-seek-to-mark ()
  (interactive)
  (eslpod-seek-to eslpod-track-time-mark))

(defun eslpod-pause ()
  (interactive)
  (emms-player-pause))

(defvar eslpod-emms-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-f") 'eslpod-forward-track)
    (define-key map (kbd "C-c C-b") 'eslpod-backward-track)
    (define-key map (kbd "C-c C-s") 'eslpod-show)
    (define-key map (kbd "C-c C-r") 'eslpod-restart-track)
    (define-key map (kbd "C-c C-e") 'emms-stop)
    (define-key map (kbd "C-c f") 'eslpod-seek-forward)
    (define-key map (kbd "C-c b") 'eslpod-seek-backward)
    (define-key map (kbd "C-c r") 'eslpod-restart-track)
    (define-key map (kbd "C-c p") 'eslpod-pause)
    (define-key map (kbd "C-c t") 'eslpod-toggle-repeat)
    (define-key map (kbd "C-c i") 'eslpod-insert-current-track-desc)
    (define-key map (kbd "C-c C-<SPC>") 'eslpod-set-mark)
    (define-key map (kbd "C-c C-u C-<SPC>") 'eslpod-seek-to-mark)
    map))

(define-minor-mode eslpod-emms-mode
  "Minor mode for control emms when playing eslpod

This minor mode defines keys for quick access:

\\{eslpod-emms-mode-map}}."
  :lighter (" ESLPod")
  :keymap eslpod-emms-mode-map
  :after-hook (eslpod-initialize))

(provide 'eslpod-emms-mode)

