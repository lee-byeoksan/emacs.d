;; -*- lexical-binding: t -*-

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package lsp-mode
  :ensure t
  :init
  (setq )
  :config
  (setq lsp-keymap-prefix "C-c C-l")
  (setq lsp-pyls-server-command "~/.local/bin/pyls")
  :hook (
         (python-mode . lsp-deferred)
         )
  :commands lsp-deferred
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(provide 'init-lsp)
