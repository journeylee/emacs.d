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
(global-set-key (kbd "s-{") 'ju/smart-previous-buffer)
(global-set-key (kbd "s-}") 'ju/smart-next-buffer)
(global-set-key (kbd "C-a") 'ju/smart-beginning-of-line)

;; ----------------------------------------------------------------------
;; window move relative settings
;; ----------------------------------------------------------------------
(global-set-key (kbd "s-f") 'windmove-right)
(global-set-key (kbd "s-b") 'windmove-left)
(global-set-key (kbd "s-p") 'windmove-up)
(global-set-key (kbd "s-n") 'windmove-down)
(global-set-key (kbd "s-a") (lambda () (windmove-down)))
(global-set-key (kbd "s-[") 'windmove-left)
(global-set-key (kbd "s-]") 'windmove-right)

;; Misc keybindings
(global-set-key (kbd "M-/") 'hippie-expand)

(defun ju/smart-next-buffer ()
  "switch current window to next-buffer which name
is't a *xxx* buffer"

  (interactive)
  (next-buffer)
  (while (and
	  (not (string-equal (buffer-name (current-buffer)) "*scratch*"))
	  (string-match-p
	  "^\\*[A-Za-z].*\\*$"
	  (buffer-name (current-buffer))))
    (next-buffer)))

(defun ju/smart-previous-buffer ()
  "switch current window to previous-buffer which name is't
a *xxx* buffer"
  (interactive)
  (previous-buffer)
  (while (and
	  (not (string-equal (buffer-name (current-buffer)) "*scratch*"))
	  (string-match-p
	  "^\\*[A-Za-z].*\\*$"
	  (buffer-name (current-buffer))))
    (previous-buffer)))

(defun ju/smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.
Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive)	; use (interactive "^") in version 23 to make shift-select work
  (let ((old-cursor-point (point)))
  (back-to-indentation)
  (and (= old-cursor-point (point))
       (beginning-of-line))))

(provide 'ju-keybind)
