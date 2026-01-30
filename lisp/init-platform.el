;;; init-platform.el --- Platform-specific configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Configure Emacs behavior based on the operating system.
;; Handles platform-specific key bindings and system integration.

;;; Code:

(pcase system-type
  ('darwin
   ;; macOS: Use Command key as Meta for better ergonomics
   ;; This allows Cmd+C/V/X to work as standard macOS shortcuts
   ;; when not overridden by Emacs bindings
   (setq mac-command-modifier 'meta)
   ;; Keep Option as super to preserve access to special characters
   ;; (like © via Option+G) while allowing it as a modifier key
   (setq mac-option-modifier 'super))
  
  ('gnu/linux
   ;; Linux-specific configuration can go here
   ;; Example: X11 or Wayland specific settings
   )
  
  ('windows-nt
   ;; Windows-specific configuration can go here
   ))

(provide 'init-platform)
;;; init-platform.el ends here
