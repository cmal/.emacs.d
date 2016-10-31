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
                    :size 20.0))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "FZLiBian-S02S"
                :weight 'normal
                :slant 'normal
                :size 24.0))))

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
;; (use-font-set-ptmono)
;; (use-font-set-pragmata)
(set-default-font "Inziu IosevkaCC CL-14")
;; (set-default-font "Inziu Iosevka CL-16")
;; (cl-prettyprint (font-family-list))

(provide 'setup-fonts)
