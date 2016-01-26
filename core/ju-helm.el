
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

(use-package helm-swoop
  :ensure t
  :bind (("M-i" . helm-swoop)
	 ("M-I" . helm-swoop-back-to-last-point)
	 ("C-c M-i" . helm-multi-swoop)
	 ("C-x M-i" . helm-multi-swoop-all))
  :init (progn
	  ;; Save buffer when helm-multi-swoop-edit complete
	  (setq helm-multi-swoop-edit-save t)
	  ;; If this value is t, split window inside the current window
	  (setq helm-swoop-split-with-multiple-windows nil)
	  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
	  (setq helm-swoop-split-direction 'split-window-vertically))
  :config (progn
	 ;; When doing isearch, hand the word over to helm-swoop
	 (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
	 ;; From helm-swoop to helm-multi-swoop-all
	 (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
	 ;; Move up and down like isearch
	 (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
	 (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
	 (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
	 (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)))

(use-package helm-projectile
  :ensure t
  :defer t)
(provide 'ju-helm)
