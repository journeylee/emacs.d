(when (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(font . "Luxi Mono 14"))
  (set-default-font "Luxi Mono 14"))

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(use-package moe-theme
  :ensure t
  :config (progn
	    (moe-dark)))

(provide 'ju-gui)
