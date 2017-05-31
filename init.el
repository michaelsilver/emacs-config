;;; init.el --- initialization
;;; Commentary:
;;; Code:

(setq warning-minimum-level :emergency)

;; Common Lisp library
(require 'cl)

(eval-when-compile
  (require 'cl))


;; Require Emacs' package functionality
(require 'package)

;; Add the Melpa repository to the list of package sources
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; Initialise the package system.
(package-initialize)

;; my lisp files
(load-file "~/.emacs.d/lisp/ms-preliminaries.el")
(when (eq system-type 'darwin) ;; mac specific settings
  (require 'ms-macosx))
(require 'ms-keybindings)
(require 'ms-visual)
(require 'ms-automode)
(require 'ms-tramp)
(require 'git-commit)
(require 'ms-git)
(require 'ms-gnuplot)

(setq enable-local-variables :all)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (google-c-style flymake-google-cpplint solarized-theme jinja2-mode graphene gnuplot git-commit company-jedi company-anaconda column-enforce-mode chicken-scheme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
