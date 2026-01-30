;;; init-vterm.el --- Terminal emulator configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Configure vterm, a fully-featured terminal emulator based on libvterm.
;; Provides better performance and compatibility than term/ansi-term.

;;; Code:

(use-package vterm
  :commands vterm
  :config
  ;; Set shell to use in vterm.
  ;; Defaults to $SHELL environment variable if not set.
  (setq vterm-shell (getenv "SHELL"))
  
  ;; Maximum scrollback lines.
  ;; Higher values use more memory but preserve more history.
  (setq vterm-max-scrollback 10000)
  
  ;; Kill buffer when vterm process exits.
  ;; Prevents accumulation of dead terminal buffers.
  (setq vterm-kill-buffer-on-exit t)
  
  ;; Send control characters directly to the terminal.
  ;; Empty list means all control characters go to the terminal process.
  ;; To keep some Emacs bindings, add them to this list.
  ;; Example: '("C-c" "C-x" "C-g") keeps common Emacs commands.
  (setq vterm-keymap-exceptions '()))

(provide 'init-vterm)
;;; init-vterm.el ends here
