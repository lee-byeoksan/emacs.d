;;; early-init.el --- Early initialization -*- lexical-binding: t -*-
;;; Commentary:
;; Loaded before package system and GUI initialization.
;; Used for performance optimizations and early UI setup.

;;; Code:

;; Defer garbage collection during startup to reduce initialization time.
;; The threshold is reset to a reasonable value in init.el after startup completes.
(setq gc-cons-threshold most-positive-fixnum)

;; Set UI elements via frame parameters before the first frame is created.
;; This prevents the brief flash of default UI chrome that would occur
;; if we disabled them after frame creation in init.el.
(setq default-frame-alist
      '((tool-bar-lines . 0)
        (menu-bar-lines . 0)
        (vertical-scroll-bars . nil)
        (horizontal-scroll-bars . nil)))

;; Prevent package.el from automatically initializing packages at startup.
;; We call package-initialize manually in init.el after configuring archives.
(setq package-enable-at-startup nil)

;; Isolate packages by Emacs version to avoid bytecode compatibility issues
;; when switching between different Emacs versions.
(setq package-user-dir
      (expand-file-name (format "elpa-%d.%d" emacs-major-version emacs-minor-version)
                        user-emacs-directory))

;; Enable asynchronous native compilation for better runtime performance.
;; Warnings are silenced to avoid popup buffers during normal usage.
(when (native-comp-available-p)
  (setq native-comp-async-report-warnings-errors 'silent)
  (setq native-comp-jit-compilation t))

(provide 'early-init)
;;; early-init.el ends here
