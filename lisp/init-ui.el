;;; init-ui.el --- Minimal UI defaults -*- lexical-binding: t; -*-

;;; Commentary:
;; Keep UI adjustments minimal and predictable.

;;; Code:

(setq inhibit-startup-screen t)
(setq use-dialog-box nil)
(setq use-file-dialog nil)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

(provide 'init-ui)

;;; init-ui.el ends here
