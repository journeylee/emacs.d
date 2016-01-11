
(use-package helm
  :ensure t
  :config (progn
	    (require 'helm-config)
	    (helm-autoresize-mode 1)
	    (define-key global-map (kbd "C-x C-b") 'helm-buffers-list)
	    (global-set-key (kbd "C-x C-f") 'helm-find-files)
	    (global-set-key (kbd "C-x C-r") 'helm-recentf)
	    (global-set-key (kbd "C-x r l") 'helm-bookmarks)
	    (global-set-key (kbd "M-x") 'helm-M-x)))

(provide 'ju-helm)
