(use-package flycheck
  :ensure t
  :config (progn
	    (add-hook 'after-init-hook #'global-flycheck-mode)

	    (eval-after-load 'flycheck
		   (setq flycheck-check-syntax-automatically '(save mode-enabled)
			 flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)
			 flycheck-checkers (delq 'html-tidy flycheck-checkers)
			 flycheck-standard-error-navigation nil))
	    (global-flycheck-mode t)))


(provide 'ju-flycheck)
