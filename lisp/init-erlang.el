;; -*- mode: elisp -*-

(setq erlang-root-dir "~/.kerl/installations/OTP_23.0.1_L0")
(setq load-path (cons (concat erlang-root-dir "/lib/tools-3.4/emacs") load-path))
(setq exec-path (cons (concat erlang-root-dir "/bin") exec-path))
(require 'erlang-start)
(setq erlang-indent-level 2)

(provide 'init-erlang)
