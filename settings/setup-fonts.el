;; (require 'chinese-fonts-setup)
;; (chinese-fonts-setup-enable)
;; (setq cfs-profiles
;;       '("coding" "read-code" "unset"))

;; font settings

;; Auto generated by chinese-fonts-setup
;; <https://github.com/tumashu/chinese-fonts-setup>
;; (set-face-attribute
;;  'default nil
;;  :font (font-spec :name "-*-PT Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
;;                   :weight 'normal
;;                   :slant 'normal
;;                   :size 12.5))
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font
;;    (frame-parameter nil 'font)
;;    charset
;;    (font-spec :name "-*-Hiragino Sans GB-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
;;               :weight 'normal
;;               :slant 'normal
;;               :size 15.0)))

;; another setting
(set-face-attribute
 'default nil
 :font (font-spec :name "-*-Input Mono Compressed-normal-normal-ultracondensed-*-*-*-*-*-m-0-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 13.0))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :name "ZoomlaXige-A002"
              :weight 'normal
              :slant 'normal
              :size 13.0)))

(provide 'setup-fonts)
