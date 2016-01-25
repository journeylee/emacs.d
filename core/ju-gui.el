(when (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(font . "Luxi Mono 14"))
  (set-default-font "Luxi Mono 14"))

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(use-package moe-theme
  :ensure t
  :config (progn
	    (moe-dark)))

(use-package smart-mode-line
  :ensure t
  :config (progn
	    (setq sml/no-confirm-load-theme t)
	    (setq sml/theme nil)
	    (add-hook 'after-init-hook #'sml/setup)))

(use-package beacon
  :ensure t
  :init (beacon-mode +1))

(provide 'ju-gui)
