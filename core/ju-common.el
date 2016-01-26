(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))


;; Shorthand.
(fset 'yes-or-no-p 'y-or-n-p)
;; make quit serious.
(setq confirm-kill-emacs 'y-or-n-p)


(provide 'ju-common)
