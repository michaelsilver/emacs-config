;;; ms-automode.el --- load modes automatically by file name
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("[.]java" . java-mode))
(add-to-list 'auto-mode-alist '("[.]m$" . octave-mode))
(add-to-list 'auto-mode-alist '("[.]gnuplot$" . gnuplot-mode))
(add-to-list 'auto-mode-alist '("[.]ino" . c++-mode))

(set-variable (quote scheme-program-name) "csi")

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(provide 'ms-automode)
;;; ms-automode.el ends here
