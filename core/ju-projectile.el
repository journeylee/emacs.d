(use-package projectile
  :ensure t
  :config (progn
	    (setq projectile-enable-caching t)
	    (setq projectile-file-exists-remote-cache-expire (* 10 60))))

(provide 'ju-projectile)