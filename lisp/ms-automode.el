;;; ms-automode.el --- load modes automatically by file name
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("[.]java" . java-mode))
(add-to-list 'auto-mode-alist '("[.]m$" . octave-mode))
(add-to-list 'auto-mode-alist '("[.]gnuplot$" . gnuplot-mode))

(provide 'ms-automode)
;;; ms-automode.el ends here
