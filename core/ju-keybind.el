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

(provide 'ju-keybind)
