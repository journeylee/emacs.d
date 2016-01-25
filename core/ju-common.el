(use-package magit :ensure t)

;; Shorthand.
(fset 'yes-or-no-p 'y-or-n-p)
;; make quit serious.
(setq confirm-kill-emacs 'y-or-n-p)


(global-set-key (kbd "C-S-k") 'kill-whole-line)
(provide 'ju-common)
