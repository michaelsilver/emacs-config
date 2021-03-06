;;; ms-keybindings.el --- miscellaneous key bindings
;;; Commentary:
;;; Code:

;; I keep hitting this accidentally when C-x C-f 'ing
;; (global-set-key (kbd "C-x f") 'find-file-in-project-by-selected)
(global-set-key (kbd "C-x f") 'find-file-rg)
(global-unset-key (kbd "C-t"))

;; for convenience
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))

(provide 'ms-keybindings)
;;; ms-keybindings.el ends here
