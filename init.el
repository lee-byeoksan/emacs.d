;;; init.el --- Load configuration files -*- lexical-binding: t -*-
;;; Commentary:
;; Main entry point of Emacs configuration.
;; Initializes package system and loads modules from lisp/.

;;; Code:

;; Restore GC threshold to a reasonable value after startup.
;; 16MB is a balance between memory usage and GC pause frequency.
;; The high threshold set in early-init.el is only for faster startup.
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))))

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Suppress byte-compilation warnings from third-party packages during startup.
;; This prevents cluttering the warnings buffer with issues in package source code
;; that we don't control (e.g., vterm's docstring escape sequences).
;; Warnings from our own configuration files are still visible.
(add-to-list 'warning-suppress-types '(bytecomp))

;; Fallback for Emacs versions before 29 where use-package is not built-in.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
;; Auto-install packages when they are referenced but not yet installed.
(setq use-package-always-ensure t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Keep Customize-generated code out of init.el.
;; The file is gitignored since it contains machine-specific settings.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Load configuration modules
(require 'init-platform)
(require 'init-vterm)
(require 'init-lsp)
(require 'init-typescript)

(provide 'init)
;;; init.el ends here
