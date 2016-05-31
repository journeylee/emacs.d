
(setq-default indent-tabs-mode nil)	; don't use tabs to indent
(setq-default tab-width 8)		; but maintain correct appearance

;; Newline at end of file (why?)
(setq require-final-newline t)

;; delete the selection with a keypress
(delete-selection-mode t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; autosave the undo-tree history
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq undo-tree-auto-save-history t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

(use-package smartparens
  :ensure t
  :init (progn
	  (require 'smartparens-config)
	  (setq sp-base-key-bindings 'paredit)
	  (setq sp-autoskip-closing-pair 'always)
	  (setq sp-hybrid-kill-entire-symbol nil)
	  (sp-use-paredit-bindings)
	  (show-smartparens-global-mode +1)))

(use-package saveplace
  :init (progn
	  (setq save-place-file (expand-file-name "saveplace" ju/save-dir))
	  (setq-default save-place t)))

;; savehist keeps track of some history
(use-package savehist
  :ensure t
  :init (progn
	  (setq savehist-additional-variables
		;; search entries
		'(search-ring regexp-search-ring)
		;; save every minute
		savehist-autosave-interval 60
		;; keep the home clean
		savehist-file (expand-file-name "savehist" ju/save-dir))
	  (savehist-mode +1)))

;; save recent files
(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" ju/save-dir)
      recentf-max-saved-items 500
      recentf-max-menu-items 15
      ;; disable recentf-cleanup on Emacs start, because it can cause
      ;; problems with remote files
      recentf-auto-cleanup 'never)

(recentf-mode +1)

;; highlight kill yank things
(use-package volatile-highlights
  :ensure t
  :diminish volatile-highlights-mode
  :config (progn
	    (volatile-highlights-mode t)))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package avy
  :ensure t
  :bind (("C-c j" . avy-goto-word-or-subword-1)
         ("s-." . avy-goto-word-or-subword-1)
         ("s-w" . ace-window))
  :init (progn
          (setq avy-background t)
          (setq avy-style 'at-full)))

(use-package anzu
  :ensure t
  :diminish anzu-mode
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :init (global-anzu-mode))

(use-package guide-key
  :ensure t
  :init (progn
          (setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
          (guide-key-mode 1)  ; Enable guide-key-mode
          ))

(provide 'ju-editor)
