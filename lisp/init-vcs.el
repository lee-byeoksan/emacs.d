;;; init-vcs.el --- Version control system configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Configure version control tools, primarily Git integration via magit.
;; Includes diff highlighting and git status indicators.

;;; Code:

;; Magit: Git porcelain for Emacs
(use-package magit
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch)
   ("C-c M-g" . magit-file-dispatch))
  :config
  ;; Show fine differences in selected hunks
  (setq magit-diff-refine-hunk t)
  ;; Show word-granularity differences within diff hunks
  (setq magit-diff-refine-ignore-whitespace nil)
  ;; Display buffer showing the thing at point in fullframe
  (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  ;; Automatically save file-visiting buffers when appropriate
  (setq magit-save-repository-buffers 'dontask))

;; Show git diff indicators in the fringe
(use-package diff-hl
  :config
  ;; Enable diff-hl globally
  (global-diff-hl-mode)
  ;; Enable diff-hl in dired
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  ;; Update diff-hl after magit operations
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(provide 'init-vcs)
;;; init-vcs.el ends here
