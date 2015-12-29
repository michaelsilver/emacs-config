;;; ms-git.el --- using emacs for git
;;; Commentary:
;;; Code:

(add-hook 'git-commit-mode-hook 'auto-fill-mode)

(global-set-key (kbd "C-x g") 'magit-status)

(provide 'ms-git)
;;; ms-git.el ends here
