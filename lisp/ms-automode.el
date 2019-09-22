;;; ms-automode.el --- load modes automatically by file name
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("[.]java" . java-mode))
(add-to-list 'auto-mode-alist '("[.]m$" . octave-mode))
(add-to-list 'auto-mode-alist '("[.]gnuplot$" . gnuplot-mode))
(add-to-list 'auto-mode-alist '("[.]ino" . c++-mode))
(add-to-list 'auto-mode-alist '("[.]js" . web-mode))
;; (add-to-list 'auto-mode-alist '("[.]js" . rjsx-mode))
(add-to-list 'auto-mode-alist '("[.]vue" . web-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("[.]ll" . llvm-mode))


(set-variable (quote scheme-program-name) "csi")

(add-hook 'c-mode-common-hook '(lambda () (c-set-offset 'statement-case-open '0)))
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'c-mode-hook (lambda () (c-toggle-comment-style -1)))

(sp-local-pair '(c-mode) "'" "'" :actions nil)

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
