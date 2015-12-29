;;; ms-python.el --- python mode settings
;;; Commentary:
;;; Code:

(eval-after-load "company"
  '(progn
     (add-to-list 'company-backends 'company-anaconda)))

(add-hook 'python-mode-hook 'anaconda-mode)

;; (add-hook 'python-mode-hook (company-mode -1))

(provide 'ms-python)
;;; ms-python.el ends here
