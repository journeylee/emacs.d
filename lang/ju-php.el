(use-package php-mode
  :ensure t
  :pin melpa
  :config (progn
	    (add-hook 'php-mode-hook
		      (lambda()
			(flyspell-prog-mode)
			(add-hook 'php-mode-hook #'semantic-mode)
			(add-hook 'before-save-hook 'delete-trailing-whitespace)))))
(provide ju-php)
