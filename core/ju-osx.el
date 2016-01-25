;; On OS X Emacs doesn't use the sehll PATH if it's not started from
;; the shell. Let's fix it:
(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

;; proced-mode doesn't work on OS X so we use vkill instead
(use-package vkill
  :ensure t
  :bind ("C-x p" . vkill))
