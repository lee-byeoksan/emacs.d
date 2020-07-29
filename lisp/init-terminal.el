;; -*- mode: elisp -*-

(defun common-term-setup ()
  (display-line-numbers-mode 0)
  (setq-local global-hl-line-mode nil))

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
