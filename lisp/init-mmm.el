;;; init-mmm.el --- Multiple Major Modes support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;----------------------------------------------------------------------------
;; Multiple major modes
;;----------------------------------------------------------------------------
(require-package 'mmm-mode)
(require 'mmm-auto)
(setq mmm-global-mode 'buffers-with-submode-classes)
(setq mmm-submode-decoration-level 2)

;; Disable the ugly background color
(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face nil)))

(provide 'init-mmm)
;;; init-mmm.el ends here
