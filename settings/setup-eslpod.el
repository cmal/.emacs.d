;;; setup-eslpod.el --- setup emms for eslpod -*- lexical-binding: t; -*-

;; (require 'emms)

;; emms-all

;; emms-source-file-default-directory

;; emms-default-players

;; (emms-setup)
;; (emms-minimalistic)

;; setup emms-default-players


;; (require 'emms)

;; emms-source-file-default-directory
;; emms-default-players

;; a full setup
;; (emms-setup)
;; (emms-all)

;; minimal setup
;;(emms-minimalistic)

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
  (setq eslpod-track-time-mark 0))

(defun eslpod-initialize ()
  (setq eslpod-index 0) ;; initialize
  (setq emms-repeat-track t)
  (initial-track-time-mark))

(defun eslpod-set-current-file (index)
 (setq eslpod-current-file
       (nth index
            (seq-filter
             (lambda (f) (s-suffix? ".mp3" f))
             (f--collect-entries "~/Music/eslpod/ESLPod Courses/" t)))))

;; add one file to playlist
;; (emms-add-file eslpod-current-file)

(defun eslpod-play-current-file ()
  (interactive)
  (emms-play-file eslpod-current-file)
  (initial-track-time-mark))

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



(defun eslpod-show ()
  ;; stolen from emms-show
  (interactive)
  (let* ((eslpod-show-format (concat emms-show-format ", current index: %d"))
         (string (if emms-player-playing-p
                     (format eslpod-show-format
                             (emms-track-description
                              (emms-playlist-current-selected-track))
                             eslpod-index)
                   (format "Nothing playing right now. current index: %d" eslpod-index))))
    (message "%s" string)))

;; (require 'stream)
;; functions defined in seq.el can use stream as input

;; directory-files-recursively
;; directory-files

;; when listening to elspod
(eslpod-initialize)

(defun eslpod-get-track-current-time ()
  (let ((playing-time (emms-track-get
                       (emms-playlist-current-selected-track)
                       'info-playing-time)))
    (mod emms-playing-time playing-time)))

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

(defun eslpod-set-mark ()
  (interactive)
  (setq eslpod-track-time-mark (eslpod-get-track-current-time))
  (message "eslpod-track-time-mark set to %d" eslpod-track-time-mark))

(defun eslpod-seek-to-mark ()
  (interactive)
  (eslpod-seek-to eslpod-track-time-mark))


(global-set-key (kbd "C-x C-y C-f") 'eslpod-forward-track)
(global-set-key (kbd "C-x C-y C-b") 'eslpod-backward-track)
(global-set-key (kbd "C-x C-y C-s") 'eslpod-show)
(global-set-key (kbd "C-x C-y C-p") 'eslpod-play-current-file)
(global-set-key (kbd "C-x C-y C-e") 'emms-stop)
(global-set-key (kbd "C-x C-y f") 'eslpod-seek-forward)
(global-set-key (kbd "C-x C-y b") 'eslpod-seek-backward)
(global-set-key (kbd "C-x C-y s") 'eslpod-seek-backward)
(global-set-key (kbd "C-x C-y p") 'emms-player-pause)
(global-set-key (kbd "C-x C-y m") 'eslpod-seek-to-mark)


(provide 'setup-eslpod)
