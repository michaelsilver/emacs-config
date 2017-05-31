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

;; highlight lines
(global-hl-line-mode 1)
(setq-default show-trailing-whitespace t)

;; enforce 80-character limit
(add-hook 'python-mode-hook 'column-enforce-mode)
(add-hook 'scheme-mode-hook 'column-enforce-mode)
(add-hook 'c-mode-common-hook 'column-enforce-mode)

;; Zoom
(defun djcb-zoom (n)
  "with positive N, increase the font size, otherwise decrease it"
  (set-face-attribute
   'default nil :height
   (+ (face-attribute 'default :height)
      (* n 5)))
  (message (format "Font size: %d"
		   (face-attribute 'default :height))))

(global-set-key (kbd "M-+")      #'(lambda nil (interactive) (djcb-zoom 1)))
(global-set-key (kbd "M--")      #'(lambda nil (interactive) (djcb-zoom -2)))

;; XXX: Have this be the last thing you do. Apparently things get
;; overriden if it is at the beginning of the file.
;; Solarized Dark Theme
(require 'graphene)

(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/")
(load-theme 'solarized t)

(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(enable-theme 'solarized)

(set-face-attribute 'mode-line nil  :height 1.05)

(provide 'ms-visual)
;;; ms-visual.el ends here
