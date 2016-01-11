(use-package company
  :ensure t
  :config (progn
	    (global-company-mode 1)
	    (setq company-idle-dely 0.2)
	    (setq company-show-numbers t)
	    (setq company-minium-prefix-length 2)
	    (setq company-dabbrev-downcase nil)
	    (setq company-auto-complete nil)
	    (setq company-dabbrev-code-other-buffers 'all)
	    (setq company-dabbrev-code-everywhere t)
	    (setq company-dabbrev-code-ignore-case t)
	    (global-set-key (kbd "C-<tab>") 'company-dabbrev)
	    (global-set-key (kbd "C-c C-y") 'company-yasnippet)))

(defun complete-or-indent ()
  (interactive)
  (if (company-manual-begin)
      (company-complete-common)
    (indent-according-to-mode)))

(provide 'ju-company-mode)
