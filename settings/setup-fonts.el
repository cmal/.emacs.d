;; (require 'chinese-fonts-setup)
;; (chinese-fonts-setup-enable)
;; (setq cfs-profiles
;;       '("coding" "read-code" "unset"))

;; font settings

;; Auto generated by chinese-fonts-setup
;; <https://github.com/tumashu/chinese-fonts-setup>

(defun use-font-set-ptmono ()
  (interactive)
  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-PT Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
                    :weight 'normal
                    :slant 'normal
                    :size 14.0))  ;; 20.0
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "FZLiBian-S02S"
                :weight 'normal
                :slant 'normal
                :size 16.0))))  ;; 24.0

;; Auto generated by chinese-fonts-setup
;; <https://github.com/tumashu/chinese-fonts-setup>
(defun use-font-set-pragmata ()
  (interactive)
  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-PragmataPro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
                    :weight 'normal
                    :slant 'normal
                    :size 14.0)) ;; 20.0
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "ZoomlaXige-A002"
                :weight 'normal
                :slant 'normal
                :size 14.0)))) ;; 20.0

(defun use-font-set-inziu ()
  (interactive)
  (set-default-font "Inziu IosevkaCC CL-16"))

;; (if (display-graphic-p) (use-font-set-ptmono))
;; (if (display-graphic-p) (use-font-set-inziu))

(if (display-graphic-p) (use-font-set-pragmata))




;; (cl-prettyprint (font-family-list))

(provide 'setup-fonts)
