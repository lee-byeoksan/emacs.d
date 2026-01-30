;;; init-navigation.el --- File and project navigation -*- lexical-binding: t -*-
;;; Commentary:
;; Configure file exploration and project navigation.
;; Uses dirvish (enhanced dired), treemacs (project tree sidebar),
;; and project.el (built-in project management).

;;; Code:

;; Project management (built-in)
(use-package project
  :ensure nil  ; Built-in
  :config
  ;; Remember recently visited projects
  (setq project-switch-commands
        '((project-find-file "Find file")
          (project-find-regexp "Find regexp")
          (project-dired "Dired")
          (project-eshell "Eshell"))))

;; Dirvish: Modern dired with icons and previews
(use-package dirvish
  :config
  ;; Replace dired with dirvish
  (dirvish-override-dired-mode)
  :custom
  ;; Mode line format
  (dirvish-mode-line-format '(:left (sort symlink) :right (omit yank index)))
  ;; Preview file contents in side window
  (dirvish-use-header-line t)
  (dirvish-use-mode-line t)
  :config
  ;; Enable file attributes (without icons)
  (setq dirvish-attributes
        '(file-time file-size collapse subtree-state vc-state git-msg))
  ;; Open files in preview window on hover
  (setq dirvish-preview-dispatchers
        (cl-substitute 'pdf-preface 'pdf dirvish-preview-dispatchers))
  :bind
  ;; Dirvish-specific keybindings
  (:map dirvish-mode-map
        ("a"   . dirvish-quick-access)
        ("f"   . dirvish-file-info-menu)
        ("y"   . dirvish-yank-menu)
        ("N"   . dirvish-narrow)
        ("^"   . dirvish-history-last)
        ("h"   . dirvish-history-jump)
        ("s"   . dirvish-quicksort)
        ("v"   . dirvish-vc-menu)
        ("TAB" . dirvish-subtree-toggle)
        ("M-f" . dirvish-history-go-forward)
        ("M-b" . dirvish-history-go-backward)
        ("M-l" . dirvish-ls-switches-menu)
        ("M-m" . dirvish-mark-menu)
        ("M-t" . dirvish-layout-toggle)
        ("M-s" . dirvish-setup-menu)
        ("M-e" . dirvish-emerge-menu)
        ("M-j" . dirvish-fd-jump)))

;; Treemacs: Project tree sidebar
(use-package treemacs
  :bind
  (("C-c t t" . treemacs)
   ("C-c t 1" . treemacs-select-window)
   ("C-c t B" . treemacs-bookmark)
   ("C-c t f" . treemacs-find-file)
   ("C-c t M-t" . treemacs-find-tag))
  :config
  ;; Width of treemacs window
  (setq treemacs-width 35)
  ;; Follow currently opened file
  (setq treemacs-follow-mode t)
  ;; Auto-refresh on file changes
  (setq treemacs-filewatch-mode t)
  ;; Show icons
  (setq treemacs-no-png-images nil)
  ;; Collapse directories with single child
  (setq treemacs-collapse-dirs 3)
  ;; Git integration
  (setq treemacs-git-mode 'deferred))

;; Treemacs integration with projectile/project.el
(use-package treemacs-projectile
  :after (treemacs project))

;; Treemacs integration with magit (optional, only if magit is available)
;; Disabled by default to avoid dependency issues.
;; Uncomment if you use magit and want treemacs integration.
;; (use-package treemacs-magit
;;   :after (treemacs magit))

(provide 'init-navigation)
;;; init-navigation.el ends here
