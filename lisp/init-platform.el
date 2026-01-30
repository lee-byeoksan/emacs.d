;;; init-platform.el --- Platform-specific configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Configure Emacs behavior based on the operating system.
;; Handles platform-specific key bindings and system integration.

;;; Code:

(pcase system-type
  ('darwin
   ;; macOS: Use Command key as Meta for better ergonomics.
   (setq mac-command-modifier 'meta)
   (when (executable-find "gls") (setq insert-directory-program "gls")))
  
  ('gnu/linux
   ;; Linux-specific configuration can go here
   ;; Example: X11 or Wayland specific settings
   )
  
  ('windows-nt
   ;; Windows-specific configuration can go here
   ))

(provide 'init-platform)
;;; init-platform.el ends here
