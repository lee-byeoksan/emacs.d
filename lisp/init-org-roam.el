;;; init-org-roam.el --- Configurations about org-roam -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/.orgs/roam")
  (org-roam-dailies-directory "daily")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain "%?" :target
      (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
      :unnarrowed t)
     ;; ("l" "programming language" plain
     ;;  "* Characteristics\n- Family: %?\n- Inspired by: \n\n* Reference\n"
     ;;  :target
     ;;  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
     ;;  :unnarrowed t)
     ))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies)
  (org-roam-db-autosync-enable))

(provide 'init-org-roam)
;;; init-org-roam.el ends here
