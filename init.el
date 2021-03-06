

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq debug-on-quit nil)
(setq debug-on-error nil)
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
(defvar ju/save-dir (expand-file-name "save" ju/root-dir)
  "This is local configuration, that will load before everything else.")

(unless (file-exists-p ju/save-dir)
  (make-directory ju/save-dir))

(add-to-list 'load-path ju/core-dir)
(add-to-list 'load-path ju/lang-dir)
(add-to-list 'load-path ju/local-dir)

;; preload the personal settings from `ju/local-preload-dir'
(when (file-exists-p ju/local-preload-dir)
  (message "Loading local pre-init files in %s..." ju/local-preload-dir)
  (mapc 'load (directory-files ju/local-preload-dir 't "^[^#].*\.el$")))

(message "Load Ju's core...")

(require 'ju-package)	       ; init elpa env and install use-package
(require 'ju-keybind)	       ; global important keybind to me
(require 'ju-editor)	       ; more powerful editor
(require 'ju-common)	       ; common package setup
(require 'ju-gui)	       ; gui settings
(require 'ju-flycheck)	       ; 都说这个好
(require 'ju-helm)	       ; helm related settings
(require 'ju-company-mode)     ; company mode settings
(require 'ju-yasnippet)        ; yasnippet settings
(require 'ju-magit)	       ; git 客户端
(require 'ju-projectile)       ; 好像是火箭
(require 'ju-automode)	       ; automode magic strolen from prelude
(require 'ju-dashdoc)	       ; dash is a super doc reader
(require 'ju-gui)	       ; make a better gui interface

;; OSX specific settings
(when (eq system-type 'darwin)
  (require 'ju-osx))

;; The package is "python" but the mode is "python-mode":

(setq custom-file (expand-file-name "custom.el" ju/local-dir))

(when (file-exists-p ju/local-dir)
  (message "Loading local configuration files in %s..." ju/local-dir)
  (mapc 'load (directory-files ju/local-dir 't "^[^#].*\.el$")))

;;; init.el ends here
(put 'erase-buffer 'disabled nil)
