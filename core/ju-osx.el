;; On OS X Emacs doesn't use the sehll PATH if it's not started from
;; the shell. Let's fix it:

(use-package exec-path-from-shell
  :if (eq window-system 'ns)
  :ensure t
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  :config
  (exec-path-from-shell-copy-env "INFOPATH")
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-initialize))

;; proced-mode doesn't work on OS X so we use vkill instead
(use-package vkill
  :ensure t
  :bind ("C-x p" . vkill))

(provide 'ju-osx)
