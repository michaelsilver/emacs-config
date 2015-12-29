;;; ms-keybindings.el --- miscellaneous key bindings
;;; Commentary:
;;; Code:

;; I keep hitting this accidentally when C-x C-f 'ing
(global-unset-key (kbd "C-x f"))

;; for convenience
(global-set-key (kbd "C-c g") 'goto-line)

(provide 'ms-keybindings)
;;; ms-keybindings.el ends here
