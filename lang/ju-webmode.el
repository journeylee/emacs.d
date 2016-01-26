(use-package web-mode
  :ensure t
  :config (progn
	    (setq web-mode-engines-alias
		  '(("php" . "\\.tpl\'")))))
(use-package company-web
  :ensure t
  :defer t)

(add-hook
 'web-mode-hook
 (lambda ()
   (set
    (make-local-variable 'company-backends)
    '(company-web-html))
   (company-mode t)))

(provide 'ju-webmode)
