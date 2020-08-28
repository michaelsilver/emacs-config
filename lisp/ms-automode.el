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
(add-to-list 'auto-mode-alist '("[.]json" . json-mode))

(add-hook 'json-mode-hook
          (lambda ()
                  (make-local-variable 'js-indent-level)
                  (setq js-indent-level 4)))

;; Python
(elpy-enable)
;; (defun goto-def-or-rgrep ()
;;   "Go to definition of thing at point or do an rgrep in project if that fails"
;;   (interactive)
;;   (condition-case nil (elpy-goto-definition)
;;                   (error (elpy-rgrep-symbol (thing-at-point 'symbol)))))
;; (define-key elpy-mode-map (kbd "M-.") 'goto-def-or-rgrep)

(defun my-recenter-elpy-goto (&rest r)
  (recenter))
(advice-add #'elpy-goto-location :after #'my-recenter-elpy-goto)
(define-key elpy-mode-map (kbd "M-.") 'elpy-goto-assignment)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;         MIT-scheme config                        ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Scheme
;; (set-variable (quote scheme-program-name) "csi")
;; (set-variable (quote scheme-program-name) "mit-scheme")

;; This is the place where you have installed scheme. Be sure to set
;; this to an appropriate value!!!
(setq scheme-root "/usr/local")

(setq scheme-program-name
      (concat
       scheme-root "/bin/mit-scheme "
       "--library " scheme-root "/lib/mit-scheme-svm1 "
       "--band " scheme-root "/lib/mit-scheme-svm1/all.com "
       "-heap 100000"))

;; generic scheme completeion
(require 'scheme-complete)
(autoload 'scheme-smart-complete "scheme-complete" nil t)
(autoload 'scheme-get-current-symbol-info "scheme-complete" nil t)
(setq lisp-indent-function 'scheme-smart-indent-function);

;; mit-scheme documentation
(require 'mit-scheme-doc)

;; Special keys in scheme mode. Use <tab> to indent scheme code to the
;; proper level, and use M-. to view mit-scheme-documentation for any
;; symbol.
(eval-after-load
 'scheme
 '(define-key scheme-mode-map "\t" 'scheme-complete-or-indent))

(eval-after-load
 'cmuscheme
 '(define-key inferior-scheme-mode-map "\t" 'scheme-complete-or-indent))

;; (eval-after-load
;;  'scheme
;;  '(define-key scheme-mode-map (kbd "M-.") 'mit-scheme-doc-lookup))

;; (eval-after-load
;;  'cmuscheme
;;  '(define-key inferior-scheme-mode-map (kbd "M-.")
;;     'mit-scheme-doc-lookup))

(eval-after-load
 'scheme
 '(define-key scheme-mode-map (kbd "M-.") 'find-tag))

(eval-after-load
 'cmuscheme
 '(define-key inferior-scheme-mode-map (kbd "M-.")
    'find-tag))

(eval-after-load
 'scheme
 '(define-key scheme-mode-map (kbd "M-,") 'tags-loop-continue))

(eval-after-load
 'cmuscheme
 '(define-key inferior-scheme-mode-map (kbd "M-,")
    'tags-loop-continue))

(eval-after-load
 'scheme
 '(define-key scheme-mode-map (kbd "M-*") 'pop-tag-mark))

(eval-after-load
 'cmuscheme
 '(define-key inferior-scheme-mode-map (kbd "M-*")
    'pop-tag-mark))


;; (defun comint-send-input-indent ()
;;   (interactive)
;;   (let ((parens (or (car (syntax-ppss)) 0)))
;;     (if (zerop parens)
;;         (comint-send-input)
;;       (newline-and-indent))))

;; (with-eval-after-load 'scheme
;;   (define-key scheme-mode-map (kbd "RET") #'comint-send-input-indent))

;; (with-eval-after-load 'cmuscheme
;;   (define-key inferior-scheme-mode-map (kbd "RET") #'comint-send-input-indent))

(with-eval-after-load 'scheme
  (define-key scheme-mode-map (kbd "C-j") #'newline-and-indent))

(with-eval-after-load 'cmuscheme
  (define-key inferior-scheme-mode-map (kbd "C-j") #'newline-and-indent))

(defun ielm-indent-line nil
  "Indent the current line as Lisp code if it is not a prompt line."
  (when (save-excursion (comint-bol t) (bolp))
    (lisp-indent-line)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;         Print a Buffer to PDF  (C-c C-p)         ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun print-to-pdf ()
  (interactive)
  (ps-spool-buffer-with-faces)
  (switch-to-buffer "*PostScript*")
  (write-file "/tmp/tmp.ps")
  (kill-buffer "tmp.ps")
  (setq pdf-target-name (concat (file-name-sans-extension buffer-file-name) ".pdf"))
  (setq cmd (concat "ps2pdf14 /tmp/tmp.ps " "\"" pdf-target-name "\""))
  (shell-command cmd)
  (shell-command "rm /tmp/tmp.ps")
  (message (concat "Saved to:  " pdf-target-name)))

(global-set-key (kbd "C-c C-p") 'print-to-pdf)

;; C-mode config
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

(defun my-go-mode-hook ()
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark))
(add-hook 'go-mode-hook 'my-go-mode-hook)

(let ((govet (flycheck-checker-get 'go-vet 'command)))
  (when (equal (cadr govet) "tool")
    (setf (cdr govet) (cddr govet))))

;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))
;; (setenv "GO111MODULE" "on")

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
