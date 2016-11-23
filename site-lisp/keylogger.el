; 256 * Last-key + Next-key

;; IMPORTANT: *keylayouts* and *current-keylayout* must be defined
;; before this file is loaded.

(defcustom every-key-press-filenames 
  (mapcar 
   (lambda (layout) 
     `(,layout . ,(concat site-lisp-dir "/keys-"
   			  (symbol-name layout))))
   *keylayouts*)
  "File in which to store the state of all of the key strokes
  you've ever made.  Must be writable and readable.")

(defcustom every-key-press-autosave-frequency (* 60 15)
  "How often to auto-save the collected data on key pair stroke
  frequencies.  Saved to `(get-every-key-press-filename)`.")

(defvar *key-table-size* (* 96 96))

(defvar *key-press-times*  
  (mapcar
   (lambda (layout)
     `(,layout . ,(make-vector *key-table-size* 0.0)))
   *keylayouts*)
  "This table stores the total seconds used in the
  inter-keystroke timing for each pair of keys.  The key
  transition i -> j has index (i - 32) * 96 + (j - 32); thus
  export to JavaScript is not particularly heavy-weight (10,000
  or so elements)")
(defvar *key-press-counts* 
  (mapcar
   (lambda (layout)
     `(,layout . ,(make-vector *key-table-size* 0)))
   *keylayouts*)
  "This table stores the total number of times each key
  transition has occured.  The indexing scheme is the same as
  that for `*key-press-counts*`")

; TODO: Currently unused
(defvar *key-press-expsq*  (make-vector *key-table-size* 0)
  "This table stores the total squared number of seconds used in
  the inter-keystroke timing for each pair of keys; it is used in
  computing the standard deviation of each key press")
(defvar *key-press-expcb*  (make-vector *key-table-size* 0)
  "This table stores the total cubed number of seconds used in
  the inter-keystroke timing for each pair of keys; it is used in
  computing the skew of each key press")

(defvar *key-press-prev* 0)
(defvar *key-press-prev-time* 0)

(defmacro def-get-key-press (name assoc-list)
  `(defun ,name (&optional layout)
     (cdr (assoc (or layout *current-keylayout*) ,assoc-list))))

(def-get-key-press get-every-key-press-filename
  every-key-press-filenames)

(def-get-key-press get-key-press-times *key-press-times*)

(def-get-key-press get-key-press-counts *key-press-counts*)

(defun every-key-press-to-idx (prev next)
  (+ (* (- prev 32) 96) (- next 32)))

(defun record-every-key-press ()
  (let ((char last-command-event)
        (time (current-time))
        (prev-char *key-press-prev*)
        (prev-time *key-press-prev-time*))
    (setq *key-press-prev* char)
    (setq *key-press-prev-time* time)
    (when (and (listp prev-time) (= (car prev-time) (car time))
               (>= prev-char 32) (>= char 32)
               (< prev-char 256) (< char 256))
      (let* ((prev-time (cdr prev-time)) (time (cdr time))
             (sd (- (car time)  (car prev-time))))
        (when (< sd 2)
          (let* ((md (- (cadr time) (cadr prev-time)))
                 (td (+ sd (/ (float md) 1000000.0)))
                 (entry (every-key-press-to-idx prev-char char))
                 (entry-sum (aref (get-key-press-times) entry))
                 (entry-count (aref (get-key-press-counts) entry)))
            (aset (get-key-press-times) entry (+ entry-sum td))
            (aset (get-key-press-counts) entry (+ entry-count 1))))))))

(defun remember-every-key-press ()
  (interactive)
  (add-hook 'post-self-insert-hook #'record-every-key-press))

(require 'cl)

(defun forget-every-key-press ()
  (interactive)
  (setq *key-press-table*  (make-vector (* 96 96) 0.0))
  (setq *key-press-counts* (make-vector (* 96 96) 0)))

(defun summarize-every-key-press ()
  (interactive)

  (let ((res (loop for i from 0 below (* 96 96)
                   when (/= (aref *key-press-counts* i) 0)
                   collect (cons (concat (char-to-string (+ (/ i 96) 32))
                                         (char-to-string (+ (% i 96) 32)))
                                 (/ (aref *key-press-table* i)
                                    (aref *key-press-counts* i))))))
    (sort res (lambda (x y) (< (cdr x) (cdr y))))))

(defvar every-key-press-timer nil)

(defun autosave-every-key-press ()
  "Start the autosaver to save every key press"
  (interactive)
  (setq every-key-press-timer
        (run-with-idle-timer every-key-press-autosave-frequency t
                             'save-every-key-press)))

(defun save-every-key-press ()
  (interactive)

  (dolist (layout *keylayouts*)
    (let ((file (get-every-key-press-filename layout)))
      (with-temp-buffer
	(print (get-key-press-times  layout) (current-buffer))
	(print (get-key-press-counts layout) (current-buffer))
	(when (file-writable-p file)
	  (write-region (point-min)
			(point-max)
			file))))))

(defun load-every-key-press ()
  (interactive)
  
  (setq *key-press-times* nil)
  (setq *key-press-counts* nil)
  (dolist (layout *keylayouts*)
    (let ((file (get-every-key-press-filename layout)))
      (if (file-exists-p file)
	(with-temp-buffer
	  (insert-file-contents file)
	  (push `(,layout . ,(read (current-buffer)))
		*key-press-times*) 
	  (push `(,layout . ,(read (current-buffer)))
		*key-press-counts*))
	(progn
	  (push `(,layout . ,(make-vector *key-table-size* 0.0))
		*key-press-times*)
	  (push `(,layout . ,(make-vector *key-table-size* 0))
		*key-press-counts*))))))

(defun keylogger-init ()
  "Suggested initialization routine. -Michael"
  (load-every-key-press)
  (autosave-every-key-press)
  (remember-every-key-press)
  (add-hook 'kill-emacs-hook 'save-every-key-press))

(provide 'keylogger)
