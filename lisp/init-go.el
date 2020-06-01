;;; init-go.el --- Go support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; Install the following packages first:
;;
;; go get -u golang.org/x/tools/cmd/godoc
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u golang.org/x/tools/cmd/guru
;; go get -u golang.org/x/tools/cmd/gorename
;; go get -u golang.org/x/lint/golint
;; go get -u github.com/rogpeppe/godef
;; go get -u github.com/mdempsky/gocode


(when (maybe-require-package 'go-mode)
  (after-load 'go-mode
    ;; goimports
    (setq gofmt-command "goimports")
    (add-hook 'go-mode-hook
              (lambda () (add-hook 'before-save-hook 'gofmt nil t)))

    ;; godef
    (define-key go-mode-map (kbd "M-.") 'godef-jump)

    ;; company-go
    (when (maybe-require-package 'company-go)
      (after-load 'company
        (add-to-list 'company-backends 'company-go)))

    ;; go-eldoc
    (when (maybe-require-package 'go-eldoc)
      (add-hook 'go-mode-hook 'go-eldoc-setup))

    ;; go-guru
    (when (maybe-require-package 'go-guru)
      (define-key go-mode-map (kbd "C-c C-o") nil)
      (define-key go-mode-map (kbd "C-c g") 'go-guru-map)
      (add-hook 'go-mode-hook 'go-guru-hl-identifier-mode))

    ;; go-rename
    (maybe-require-package 'go-rename)))


(provide 'init-go)
;;; init-go.el ends here
