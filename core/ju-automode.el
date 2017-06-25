(defmacro ju/auto-mode-init (extension package mode)
  "docs here"
  `(add-to-list 'auto-mode-alist
		`(,extension . (lambda ()
				 (require ',package nil t)
				 (,mode)))))

(defvar ju/auto-mode-alist
  '(("\\.php\\'" ju-php php-mode)
    ("\\.css\\'" ju-css css-mode)
    ("\\.tpl\\'" ju-webmode web-mode)
    ("\\.html?\\'" ju-webmode web-mode)
    ("\\.psp\\'" ju-webmode web-mode)
    ("tpl/\\.php\\'" ju-webmode web-mode)
    ("\\.js\\'" ju-js js2-mode)
    ("\\.less\\'" ju-less skewer-mode)
    ("\\.go\\'" ju-go go-mode)))

(mapc
 (lambda (entry)
   (let ((extension (car entry))
	 (package (cadr entry))
	 (mode (cadr (cdr entry))))
     (ju/auto-mode-init extension package mode)))
 ju/auto-mode-alist)


(provide 'ju-automode)
