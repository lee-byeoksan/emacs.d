;;; init-macos.el --- macOS-specific settings -*- lexical-binding: t; -*-

;;; Commentary:
;; Environment setup for macOS GUI/daemon sessions.

;;; Code:

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none)
  (use-package exec-path-from-shell
    :config
    (dolist (var '("PATH" "SSH_AUTH_SOCK" "LANG" "LC_CTYPE" "NIX_PATH" "NIX_SSL_CERT_FILE"))
      (add-to-list 'exec-path-from-shell-variables var))
    (exec-path-from-shell-initialize)))

(provide 'init-macos)

;;; init-macos.el ends here
