(use-package company
	     :ensure t
	     :diminish company-mode
	     :defer t
	     :init (add-hook 'after-init-hook 'global-company-mode)
	     :bind ("C-x C-u" . company-complete)
	     :config
	     (progn
	       (setq company-idle-delay 0.2
		     company-minimum-prefix-length 2
		     company-tooltip-align-annotations t
		     company-show-numbers t
		     company-require-match nil
		     company-dabbrev-ignore-case nil
		     company-dabbrev-downcase nil
		     company-frontends '(company-pseudo-tooltip-frontend)
		     )))

(provide 'ju-company-mode)
