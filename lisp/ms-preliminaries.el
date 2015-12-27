;;; ms-preliminaries.el --- sets up paths
;;; Commentary:
;;; Require this in every module to make sure it can run independently.

;;; Code:
(setq dotemacs-dir "~/.emacs.d/")
(defun my-expand-path (f) (concat dotemacs-dir f))
(add-to-list 'load-path (my-expand-path "lisp"))

(provide 'ms-preliminaries)
;;; ms-preliminaries ends here
