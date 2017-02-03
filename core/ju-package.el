(require 'cl)
(require 'package)

(setq package-archives
      (append package-archives
              '(("gnu" . "https://elpa.zilongshanren.com/gnu/"))
              '(("melpa" . "https://elpa.zilongshanren.com/melpa/"))
              '(("marmalade" . "https://elpa.zilongshanren.com/marmalade/"))
              '(("org" . "https://elpa.zilongshanren.com/org/"))))
;;'(("melpa" . "https://melpa.org/packages/"))
;;'(("marmalade" . "https://marmalade-repo.org/packages/"))
;;'(("org" . "http://orgmode.org/elpa/"))))

;; set package-user-dir to be relative to Ju/Root-dir
(setq package-user-dir (expand-file-name "elpa" ju/root-dir))
(package-initialize)

(unless package-archive-contents
  (message "Refreshing ELPA package archives...")
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (message "`use-package' not found.  Installing...")
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(provide 'ju-package)
