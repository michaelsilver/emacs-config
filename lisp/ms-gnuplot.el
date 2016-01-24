;;; ms-gnuplot.el --- gnuplot customization
;;; Commentary:
;;; Code:

;; specify the gnuplot executable (if other than /usr/bin/gnuplot)
(setq gnuplot-program "/usr/local/bin/gnuplot")

(add-hook 'gnuplot-mode-hook 'linum-mode)

(provide 'ms-gnuplot)
;;; ms-gnuplot.el ends here
