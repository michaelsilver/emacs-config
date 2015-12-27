;;; init.el --- initialization
;;; Commentary:
;;; Code:

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
(require 'ms-visual)
(require 'ms-tramp)

(setq enable-local-variables :all)

(provide 'init)
;;; init.el ends here
