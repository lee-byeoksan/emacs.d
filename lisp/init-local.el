;;; init-local.el --- Local Configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; From my old configuration

;; General Key Mappings
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "<f8>") 'display-line-numbers-mode)


;; Overrides
(when *is-a-mac*
  (setq mac-option-modifier 'meta))


;; Terminal
(use-package vterm
  :ensure t
  :config
  (setq vterm-always-compile-module t)

  :bind (
         :map vterm-mode-map
         ("C-]" . vterm--self-insert)
         ("C-u" . vterm--self-insert)))


;; Org
(setq org-directory "~/.orgs")
(defvar byeoksan/org-inbox (concat org-directory "/inbox.org"))
(defvar byeoksan/org-gtd (concat org-directory "/tasks.org"))
(setq org-default-notes-file byeoksan/org-inbox)
(setq org-agenda-files
      (list byeoksan/org-inbox
            byeoksan/org-gtd))

;; Org Roam
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  (setq org-roam-directory "~/.orgs/roam")

  :config
  (org-roam-db-autosync-enable)
  (setq org-roam-completion-everywhere t)
  (require 'org-roam-dailies)

  ;; Dailies
  (setq org-roam-dailies-directory "daily")
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?" :target
           (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
           :unarrowed t)))

  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-roam-dailies-map
         ("y" . org-roam-dailies-capture-yesterday)
         ("t" . org-roam-dailies-capture-tomorrow))

  :bind-keymap ("C-c n d" . org-roam-dailies-map))


;; Programming
(use-package eglot
  :ensure t)


;; Typescript
(add-hook 'typescript-mode 'eglot-ensure)
(use-package web-mode
  :ensure t
  :mode "\\.tsx\\'")


;; Protobuf
(use-package protobuf-mode
  :ensure t)

;; CMake
(use-package cmake-mode
  :ensure t)

(provide 'init-local)
;;; init-local.el ends here
