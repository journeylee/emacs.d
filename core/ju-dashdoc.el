;; Support for the http://kapeli.com/dash documentation borwser

(defun ju/dash-installed-p ()
  "Check if dash install on running machine."
  (let ((lsregister "/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"))
    (and (file-executable-p lsregister)
	 (not (string-equal
	       ""
	       (shell-command-to-string
		(concat lsregister " -dump | grep com.kapeli.dash")))))))

(when (eq system-type 'darwin)
  (message "Checking whether Dash is installed...")
  (when (ju/dash-installed-p)
    (progn
      (message "t")
      (use-package dash-at-point
	:ensure t
	:bind ("C-c D" . dash-at-point)))))

(provide 'ju-dashdoc)
