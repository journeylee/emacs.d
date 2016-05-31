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

(use-package php-auto-yasnippets
  :ensure t
  :bind (:map php-mode-map ("C-c C-y" . yas/create-php-snippet)))

(add-hook 'php-mode-hook
          '(lambda ()
             (company-mode 0)
             (auto-complete-mode t)
             (require 'ac-php)
             (setq ac-sources  '(ac-source-php ) )
             (yas-global-mode 1)
             (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
             (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
             ))

;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
(projectile-mode t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(provide 'ju-php)
