;;; init-org.el --- Org defaults -*- lexical-binding: t; -*-

;;; Commentary:
;; Minimal Org configuration.

;;; Code:

(use-package org
  :ensure nil
  :custom
  (org-directory (expand-file-name "~/.orgs"))
  (org-default-notes-file (expand-file-name "inbox.org" org-directory)))

(provide 'init-org)

;;; init-org.el ends here
