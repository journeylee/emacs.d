(use-package php-mode
  :ensure t
  :config (progn
	    (add-hook 'php-mode-hook
		      (lambda()
			;; (flyspell-prog-mode)
			;; (add-hook 'php-mode-hook #'semantic-mode)
			(add-hook 'before-save-hook 'delete-trailing-whitespace)))))

(use-package ac-php
  :ensure t
  :config (progn
	    (add-hook 'php-mode-hook
		      (lambda ()
			(company-mode t)
			(add-to-list 'company-mode 'company-ac-php-backend)))))


(provide 'ju-php)
