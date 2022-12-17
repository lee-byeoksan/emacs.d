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
;; https://gist.github.com/gsj987/64d48bf49a374c96421ad20df886e947
(use-package eglot
  :ensure t
  :hook
  ((typescript-mode typescriptreact-mode) . eglot-ensure)
  :config
  (cl-pushnew '((typescript-mode typescriptreact-mode) . ("typescript-language-server" "--stdio"))
              eglot-server-programs :test #'equal))

(use-package pyenv-mode
  :ensure t)

;; Completion
;; override init-corfu.el
(setq completion-cycle-threshold nil)

;; Typescript
;; https://notes.alexkehayias.com/setting-up-typescript-and-eslint-with-eglot/
(cl-defmethod project-root ((project (head eglot-project)))
  (cdr project))
(defun my-project-try-tsconfig-json (dir)
  (when-let* ((found (locate-dominating-file dir "tsconfig.json")))
    (cons 'eglot-project found)))
(add-hook 'project-find-functions 'my-project-try-tsconfig-json nil nil)

;; https://github.com/katspaugh/.emacs.d/blob/master/packages.el
;; https://vxlabs.com/2022/06/12/typescript-development-with-emacs-tree-sitter-and-lsp-in-2022/
(use-package web-mode
  :ensure t)

(use-package typescript-mode
  :config
  (define-derived-mode typescriptreact-mode web-mode "TypeScriptReact")
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescriptreact-mode)))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package apheleia
  :ensure t
  :config
  (add-to-list 'apheleia-mode-alist '(web-mode . prettier))
  (add-to-list 'apheleia-mode-alist '(typescript-mode . prettier))
  (add-to-list 'apheleia-mode-alist '(javascript-mode . prettier))
  (apheleia-global-mode t))

;; Protobuf
(use-package protobuf-mode
  :ensure t)

;; CMake
(use-package cmake-mode
  :ensure t)

(provide 'init-local)
;;; init-local.el ends here
