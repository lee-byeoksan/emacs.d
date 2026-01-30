;;; init-theme.el --- Visual theme and appearance -*- lexical-binding: t -*-
;;; Commentary:
;; Configure visual appearance with doom-themes and doom-modeline.
;; Provides a modern, polished UI with rich visual feedback.

;;; Code:

;; Doom Themes: Popular theme collection with excellent integration
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  
  ;; Load a specific doom theme
  ;; Popular themes: doom-one, doom-vibrant, doom-nord, doom-dracula,
  ;; doom-solarized-dark, doom-solarized-light, doom-gruvbox, etc.
  ;; Run M-x load-theme to choose interactively
  (load-theme 'doom-one t)
  
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Corrects (and improves) org-mode's native fontification
  (doom-themes-org-config))

;; String manipulation library (required by doom-modeline)
(use-package s)

;; Doom Modeline: Beautiful and feature-rich mode line
(use-package doom-modeline
  :after s
  :config
  ;; Enable doom-modeline
  (doom-modeline-mode 1)
  
  ;; Height of the mode line
  (setq doom-modeline-height 25)
  
  ;; Width of mode line bar
  (setq doom-modeline-bar-width 4)
  
  ;; Disable file icons in mode line
  (setq doom-modeline-icon nil)
  
  ;; Show file encoding info
  (setq doom-modeline-buffer-encoding t)
  
  ;; Show indentation style (tabs vs spaces)
  (setq doom-modeline-indent-info t)
  
  ;; Show LSP/eglot status
  (setq doom-modeline-lsp t)
  
  ;; Show GitHub notifications count (requires ghub)
  (setq doom-modeline-github nil)
  
  ;; Modeline segments on left/right
  (setq doom-modeline-modal-icon t)
  
  ;; Limit project detection for performance
  (setq doom-modeline-project-detection 'auto))

;; Optional: Rainbow delimiters for parentheses
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; Optional: Highlight TODO/FIXME in comments
(use-package hl-todo
  :hook
  (prog-mode . hl-todo-mode)
  :config
  ;; Keywords to highlight
  (setq hl-todo-keyword-faces
        '(("TODO"   . "#ff6c6b")
          ("FIXME"  . "#ff6c6b")
          ("HACK"   . "#ECBE7B")
          ("REVIEW" . "#51afef")
          ("NOTE"   . "#98be65")
          ("DEPRECATED" . "#5B6268"))))

;; Display line numbers in programming modes
(use-package display-line-numbers
  :ensure nil  ; Built-in
  :hook
  (prog-mode . display-line-numbers-mode)
  :config
  ;; Show relative line numbers for easier navigation
  (setq display-line-numbers-type 'relative))

(provide 'init-theme)
;;; init-theme.el ends here
