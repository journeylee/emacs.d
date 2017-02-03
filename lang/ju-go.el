(use-package go-mode
  :ensure t
  :config (add-hook 'go-mode-hook 'my-go-mode-hook))

(use-package company-go
  :ensure t
  :defer t)

;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
(projectile-mode t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(defun my-go-mode-hook ()
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  ;; indent using 4 spaces
  (setq tab-width 4)
  (setq indent-tabs-mode 1)
  ;; Autocomplete for golang
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
  )

(provide 'ju-go)
