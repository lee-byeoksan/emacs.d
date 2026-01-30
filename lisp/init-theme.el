;;; init-theme.el --- Visual theme and appearance -*- lexical-binding: t -*-
;;; Commentary:
;; Configure visual appearance with ef-themes, doom-modeline, and icons.
;; Provides a modern, polished UI with rich visual feedback.

;;; Code:

;; Nerd Icons: Icon fonts for file types and modes
(use-package nerd-icons
  :config
  ;; Run M-x nerd-icons-install-fonts on first setup
  ;; This downloads and installs required icon fonts
  )

;; ef-themes: Legible, customizable themes by Protesilaos Stavrou
(use-package ef-themes
  :config
  ;; Load a specific ef theme
  ;; Available themes: ef-spring, ef-summer, ef-autumn, ef-winter,
  ;; ef-frost, ef-dark, ef-light, ef-duo-dark, ef-duo-light, etc.
  ;; Run M-x ef-themes-select to choose interactively
  (load-theme 'ef-winter t)
  
  ;; Disable other themes before loading a new one
  (setq ef-themes-disable-other-themes t)
  
  ;; Customize specific faces (optional)
  ;; (setq ef-themes-headings '((t . (variable-pitch 1.5))))
  )

;; Doom Modeline: Beautiful and feature-rich mode line
(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  :config
  ;; Height of the mode line
  (setq doom-modeline-height 25)
  
  ;; Width of mode line bar
  (setq doom-modeline-bar-width 4)
  
  ;; Show file icons in mode line
  (setq doom-modeline-icon t)
  
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
