
;; 8< ---- cut here for init-packages ---- >8
(require 'cl)
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)


;; set package-user-dir to be relative to Ju/Root-dir
(setq package-user-dir (expand-file-name "elpa" ju/root-dir))
(package-initialize)

(unless (package-installed-p 'use-package)
  (progn
    (package-refresh-contents)
    (package-install 'use-package)))

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(provide 'ju-package)
