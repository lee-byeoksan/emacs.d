;;; init-edit.el --- Basic editing defaults -*- lexical-binding: t; -*-

;;; Commentary:
;; Small, sensible editing defaults for daily use.

;;; Code:

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(when (fboundp 'electric-pair-mode)
  (electric-pair-mode 1))
(when (fboundp 'electric-indent-mode)
  (electric-indent-mode 1))

(when (fboundp 'show-paren-mode)
  (show-paren-mode 1))

(when (fboundp 'global-auto-revert-mode)
  (global-auto-revert-mode 1))
(setq global-auto-revert-non-file-buffers t)

(when (fboundp 'so-long-enable)
  (so-long-enable))

(column-number-mode 1)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'flymake-mode)
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))

(provide 'init-edit)

;;; init-edit.el ends here
