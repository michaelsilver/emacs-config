;;; init.el --- initialization
;;; Commentary:
;;; Code:

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
(require 'ms-tramp)
(require 'git-commit)
(require 'ms-git)
(require 'autopep8)

(setq enable-local-variables :all)

(provide 'init)
;;; init.el ends here
