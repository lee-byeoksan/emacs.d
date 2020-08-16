;; -*- lexical-binding: t -*-

(setq erlang-root-dir "~/.kerl/installations/OTP_23.0.1_L0")
(setq load-path (cons (concat erlang-root-dir "/lib/tools-3.4/emacs") load-path))
(setq exec-path (cons (concat erlang-root-dir "/bin") exec-path))
(require 'erlang-start)
(setq erlang-indent-level 2)

(defun erlang-mode-setup ()
  (setq-local fci-rule-column 120)
  (fci-mode 1)
  )

(add-hook 'erlang-mode-hook #'erlang-mode-setup)

(provide 'init-erlang)
