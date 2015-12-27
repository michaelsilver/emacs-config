;;; ms-visual.el --- visual theme setup
;;; Commentary:
;;; Code:

;; put file path in app head
(setq-default
 frame-title-format
 (list '((buffer-file-name " %f" (dired-directory
                                  dired-directory
                                  (revert-buffer-function " %b"
                                                          ("%b - Dir:  " default-directory)))))))

;; have this last
;; Solarized Dark Theme
(require 'graphene)

(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/")
(load-theme 'solarized t)

(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(enable-theme 'solarized)

(provide 'ms-visual)
;;; ms-visual.el ends here
