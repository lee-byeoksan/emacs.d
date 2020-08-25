;;; init-terminal.el --- Configurations on terminals -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun common-term-setup ()
  (setq-local global-hl-line-mode nil)
  (setq-local show-trailing-whitespace nil)
  )

;; term, ansi-term
(add-hook 'term-mode-hook #'common-term-setup)

;; vterm
(use-package vterm
  :ensure t
  :bind (:map vterm-mode-map
              ("C-]" . vterm--self-insert)
              ("C-u" . vterm--self-insert))
  :config
  (setq vterm-always-compile-module t)
  :hook (vterm-mode . common-term-setup))

(provide 'init-terminal)
;;; init-terminal.el ends here
