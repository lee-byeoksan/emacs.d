;;; init-eglot.el --- Eglot configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; LSP support using built-in eglot.

;;; Code:

(use-package eglot
  :ensure nil
  :hook ((js-ts-mode
          typescript-ts-mode
          c-ts-mode
          c++-ts-mode) . eglot-ensure)
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  :config
  (setq eglot-server-programs
        '(((js-ts-mode typescript-ts-mode) . ("typescript-language-server" "--stdio"))
          ((c-ts-mode c++-ts-mode) . ("clangd")))))

(use-package consult-eglot)

(provide 'init-eglot)

;;; init-eglot.el ends here
