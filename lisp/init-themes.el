(when (< emacs-major-version 24)
  (require-package 'color-theme))

(require-package 'abyss-theme)

(load-theme #'abyss t)

(provide 'init-themes)
