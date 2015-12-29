;; Mac-specific settings

;; key bindings
(setq mac-option-modifier 'alt)
(setq mac-command-modifier 'meta)
(global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete

;; This is Apple-h, the key-binding for hinding an app
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)

(provide 'ms-macosx)
