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
(setq org-startup-indented t)

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

(use-package pyenv-mode
  :ensure t)

;; Typescript
;; (add-hook 'typescript-mode 'eglot-ensure)
;; Use tide instead of eglot, eglot + typescript-language-server is way slow

;; https://github.com/katspaugh/.emacs.d/blob/master/packages.el
(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode))
  :mode (("\\.tsx\\'" . typescript-mode)))

;; (defun setup-tide-mode ()
;;   (interactive)
;;   (defun tide-imenu-index () nil)
;;   (tide-setup)
;;   (tide-hl-identifier-mode +1))

;; (use-package tide
;;   :ensure t
;;   :after (typescript-mode company flycheck)
;;   :hook ((typescript-mode . #'setup-tide-mode)
;;          (js-mode . #'setup-tide-mode)
;;          (js2-mode . #'setup-tide-mode)
;;          (rjsx-mode . #'setup-tide-mode)))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         ;; (before-save . tide-format-before-save)
         ))

;; (use-package mmm-mode
;;   :config
;;   (progn
;;     (setq mmm-global-mode t)
;;     (setq mmm-submode-decoration-level 0) ;; Turn off background highlight
;;     (mmm-add-classes
;;      '((mmm-styled-mode
;;         :submode css-mode
;;         :front "\\(styled\\|css\\)[.()<>[:alnum:]]?+`"
;;         :back "`;")))
;;     (mmm-add-mode-ext-class 'typescript-mode nil 'mmm-styled-mode)

;;     (mmm-add-classes

;;      '((mmm-jsx-mode
;;         :front "\\(return\s\\|n\s\\|(\n\s*\\)<"
;;         :front-offset -1
;;         :back ">\n?\s*)"
;;         :back-offset 1
;;         :submode web-mode)))
;;     (mmm-add-mode-ext-class 'typescript-mode nil 'mmm-jsx-mode)))

;; (defun mmm-reapply ()
;;   (mmm-mode)
;;   (mmm-mode))

;; (add-hook 'after-save-hook
;;           (lambda ()
;;             (when (string-match-p "\\.tsx?" buffer-file-name)
;;               (mmm-reapply))))

;; (use-package web-mode
;;   :ensure t
;;   :mode "\\.tsx\\'")

;; Protobuf
(use-package protobuf-mode
  :ensure t)

;; CMake
(use-package cmake-mode
  :ensure t)

(provide 'init-local)
;;; init-local.el ends here
