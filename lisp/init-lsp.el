;;; init-lsp.el --- Configurations about LSP -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit))

(use-package company
  :ensure t
  :hook (
         (after-init-hook . global-company-mode)
         )
  )

(use-package lsp-mode
  :ensure t
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
;;; init-lsp.el ends here
