(defmacro ju/auto-mode-init (extension package mode)
  "docs here"
  `(add-to-list 'auto-mode-alist
		`(,extension . (lambda ()
				 (require ',package nil t)
				 (,mode)))))

(defvar ju/auto-mode-alist
  '(("\\.php\\'" ju-php php-mode)
    ("\\.css\\'" ju-css css-mode)
    ("\\.tpl\\'" ju-tpl web-mode)))

(mapc
 (lambda (entry)
   (let ((extension (car entry))
	 (package (cadr entry))
	 (mode (cadr (cdr entry))))
     (ju/auto-mode-init extension package mode)))
 ju/auto-mode-alist)


(provide 'ju-automode)
