;;; ms-automode.el --- load modes automatically by file name
;;; Commentary:
;;; Code:

(require 'flycheck)

(add-to-list 'auto-mode-alist '("[.]java" . java-mode))
(add-to-list 'auto-mode-alist '("[.]m$" . octave-mode))
(add-to-list 'auto-mode-alist '("[.]gnuplot$" . gnuplot-mode))
(add-to-list 'auto-mode-alist '("[.]ino" . c++-mode))
(add-to-list 'auto-mode-alist '("[.]js" . web-mode))
;; (add-to-list 'auto-mode-alist '("[.]js" . rjsx-mode))
(add-to-list 'auto-mode-alist '("[.]vue" . web-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("[.]ll" . llvm-mode))

;; TIDE (Typescript)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "js" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; configure jsx-tide checker to run after your default jsx checker
(flycheck-add-mode 'javascript-eslint 'web-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(set-variable (quote scheme-program-name) "csi")

(add-hook 'c-mode-common-hook '(lambda () (c-set-offset 'statement-case-open '0)))
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'c-mode-hook (lambda () (c-toggle-comment-style -1)))

(sp-local-pair '(c-mode) "'" "'" :actions nil)

;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-irony))

(setq octave-mode-hook
      (lambda () (progn (setq octave-comment-char ?%)
                        (setq comment-start "% ")
                        (setq comment-add 0))))

;; (with-eval-after-load 'cmuscheme
;;   (define-key inferior-scheme-mode-map (kbd "C-j") #'newline-and-indent))

(defun comint-send-input-indent ()
  (interactive)
  (let ((parens (or (car (syntax-ppss)) 0)))
    (if (zerop parens)
        (comint-send-input)
      (newline-and-indent))))

(with-eval-after-load 'cmuscheme
  (define-key inferior-scheme-mode-map (kbd "RET") #'comint-send-input-indent))

;; Tramp perf optimizations
(setq remote-file-name-inhibit-cache nil)
(setq tramp-completion-reread-directory-timeout nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))
(setq tramp-verbose 1)
(customize-set-variable 'tramp-use-ssh-controlmaster-options nil)

(provide 'ms-automode)
;;; ms-automode.el ends here
