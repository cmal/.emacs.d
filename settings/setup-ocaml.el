;; Add the opam lisp dir to the emacs load path
;; TODO: test whether ocaml exists...

(comment
 (add-to-list
  'load-path
  (replace-regexp-in-string
   "\n" "/share/emacs/site-lisp"
   (shell-command-to-string "opam config var prefix")))

 (setq auto-mode-alist
       (append '(("\\.ml[ily]?$" . tuareg-mode))
               auto-mode-alist))

 ;; -- Tweaks for OS X -------------------------------------
 ;; Tweak for problem on OS X where Emacs.app doesn't run the right
 ;; init scripts when invoking a sub-shell
 (cond
  ((eq window-system 'ns) ; macosx
   ;; Invoke login shells, so that .profile or .bash_profile is read
   (setq shell-command-switch "-lc")))

 ;; Automatically load utop.el
 (autoload 'utop "utop" "Toplevel for OCaml" t)

 ;; Use the opam installed utop
 (setq utop-command "opam config exec -- utop -emacs")

 (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
 (add-hook 'tuareg-mode-hook 'utop-minor-mode)

 )

(provide 'setup-ocaml)
