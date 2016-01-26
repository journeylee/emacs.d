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
  :defer t)

(add-hook 'php-mode-hook
	  (lambda ()
	    (company-mode t)
	    (require 'ac-php-company)
	    (add-to-list 'company-backends 'company-ac-php-backend)))

;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
(projectile-mode t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
                        
(provide 'ju-php)
