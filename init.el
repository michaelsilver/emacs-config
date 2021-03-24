;;; init.el --- initialization
;;; Commentary:
;;; Code:

(require 'server)
(unless (server-running-p)
  (server-start))

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
(require 'llvm-mode)
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
 '(auth-source-save-behavior nil)
 '(css-indent-offset 2 t)
 '(flycheck-go-golint-executable nil)
 '(graphviz-dot-indent-width 4)
 '(js-indent-level 2)
 '(package-selected-packages
   '(graphviz-dot-mode jedi k8s-mode exec-path-from-shell systemd company-nginx nginx-mode find-file-rg prettier-js find-file-in-project go-dlv flycheck-golangci-lint tide dotenv-mode yaml-mode dockerfile-mode terraform-mode gitignore-mode go-mode company-coq proof-general magit markdown-mode coffee-mode rjsx-mode js-doc json-mode web-mode google-c-style flymake-google-cpplint solarized-theme jinja2-mode graphene gnuplot git-commit company-jedi company-anaconda column-enforce-mode chicken-scheme))
 '(ps-left-header '(ps-get-buffer-name))
 '(require-final-newline t)
 '(tab-width 8)
 '(tramp-use-ssh-controlmaster-options nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 2)
 '(web-mode-style-padding 0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-block-delimiter-face ((t nil)))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#839496")))))
