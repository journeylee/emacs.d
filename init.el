;; main configuration entry point
(defvar current-user
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Powering up... Be patient, Master %s!" current-user)

;; version check, only 24.1 or above, old man got killed
(when (version< emacs-version "24.1")
  (error "Require at least GNU Emacs 24.1 to run, but you're running %s" emacs-version))

;;---------------------------------------------------------------------------
;; Perfomance tunning
;;----------------------------------------------------------------------------
;; Always load newest byte code
(setq load-prefer-newer t)

;; recude the frequency of garbage collection by making it happen on each 50MB
;; of allocate data (the default is on every 0.76MB)
(setq gc-cons-threshold (* 128 1024 1024))

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;;----------------------------------------------------------------------------
;; Directories
;; structs stolen from prelude
;;----------------------------------------------------------------------------
(defvar ju/root-dir user-emacs-directory
  "The root dir of ju's Emacs configuration set.")
(defvar ju/core-dir (expand-file-name "core" ju/root-dir)
  "The core functionality script home.")
(defvar ju/lang-dir (expand-file-name "lang" ju/root-dir)
  "The languages supported files, automatically load with extensions.")
(defvar ju/autosave-dir (expand-file-name "autosave" ju/root-dir)
  "The auto autosave/history files saved here.")
(defvar ju/local-dir (expand-file-name "local" ju/root-dir)
  "This directory is for local configuration.")
(defvar ju/local-preload-dir (expand-file-name "preload" ju/local-dir)
  "This is local configuration, that will load before everything else.")

(add-to-list 'load-path ju/core-dir)
(add-to-list 'load-path ju/lang-dir)
(add-to-list 'load-path ju/local-dir)

;; preload the personal settings from `ju/local-preload-dir'
(when (file-exists-p ju/local-preload-dir)
  (message "Loading local configuration files in %s..." ju/local-preload-dir)
  (mapc 'load (directory-files ju/local-preload-dir 't "^[^#].*\.el$")))

(message "Load Ju's core...")
  
(require 'ju-package) ;; init elpa env and install use-package
(require 'ju-automode) ;; automode magic strolen from prelude
(require 'ju-automode) ;; automode magic strolen from prelude
(require 'ju-automode) ;; automode magic strolen from prelude
(require 'ju-automode) ;; automode magic strolen from prelude

;;##############################
;; global key bindings
;;##############################
;; C-h: backspace, very importent to me!!
(define-key key-translation-map [?\C-h] [?\C-?])
;; make C-w act like normal
(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "C-h") 'delete-backward-char)

(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "M-h") 'backward-kill-word)

(global-set-key (kbd "s-h") 'help-command)
(global-set-key (kbd "<s-return>") 'toggle-frame-maximized)
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)
(global-set-key (kbd "s-[") 'windmove-left)
(global-set-key (kbd "s-]") 'windmove-right)

(set-default-font "PT Mono 14")

(set-fontset-font "fontset-default" 'han '("STHeiti"))

;;; init.el ends here
