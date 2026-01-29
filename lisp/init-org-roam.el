;;; init-org-roam.el --- Org-roam setup -*- lexical-binding: t; -*-

;;; Commentary:
;; Minimal org-roam v2 configuration.

;;; Code:

(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/.orgs"))
  :config
  (org-roam-db-autosync-mode))

(provide 'init-org-roam)

;;; init-org-roam.el ends here
