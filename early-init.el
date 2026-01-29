;;; early-init.el --- Early init settings -*- lexical-binding: t; -*-

;;; Commentary:
;; Keep startup minimal and fast. No theme or font tweaks here.

;;; Code:

(setq package-enable-at-startup nil)

;; Startup performance
(setq gc-cons-threshold (* 128 1024 1024))
(setq gc-cons-percentage 0.6)
(setq read-process-output-max (* 1024 1024))

;; Minimal UI
(setq inhibit-startup-screen t)
(setq use-dialog-box nil)
(setq use-file-dialog nil)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

;; Restore GC settings after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 32 1024 1024))
            (setq gc-cons-percentage 0.1)))

(provide 'early-init)

;;; early-init.el ends here
