;;; init-git.el --- Git integration -*- lexical-binding: t; -*-

;;; Commentary:
;; Git support with Magit and diff-hl.

;;; Code:

(use-package magit)

(use-package diff-hl
  :init
  (global-diff-hl-mode)
  :hook (dired-mode . diff-hl-dired-mode)
  :config
  (with-eval-after-load 'magit
    (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh)))

(provide 'init-git)

;;; init-git.el ends here
