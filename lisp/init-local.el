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

(use-package ghostel
  :ensure t
  :custom
  (ghostel-shell-integration nil)
  (ghostel-glyph-scale-floor 1.0))

(use-package ghostel-ime
  :hook (ghostel-mode . ghostel-ime-mode))

;; Emacs AI Management
(use-package eam
  :ensure nil
  :vc (
       :url "https://github.com/lee-byeoksan/emacs-packages.git"
       :branch "main"
       :rev :newest
       :lisp-dir "eam/lisp")
  :demand t
  :init
  (setq eam-directory (expand-file-name "~/.eam/"))
  :config
  (require 'eam-app)
  (eam-keys-mode 1)
  :custom
  (eam-quick-directory "~/workspace/"))

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
         ("C-c n i" . org-roam-node-insert)))

;; Programming
;; https://gist.github.com/gsj987/64d48bf49a374c96421ad20df886e947
(use-package eglot
  :ensure t
  :hook
  ((typescript-mode typescriptreact-mode) . eglot-ensure)
  :config
  ;; Patch to avoid NUL bytes just in case from language server
  ;; https://github.com/adimit/config/blob/f84b34c04d101bdd33e180c07715ce481608ba9f/emacs/main.org#work-around-null-bytes-in-json-response
  ;; https://github.com/typescript-language-server/typescript-language-server/issues/559#issuecomment-1259470791
  ;; (advice-add 'json-parse-string :around
  ;;             (lambda (orig string &rest rest)
  ;;               (apply orig (s-replace "\\u0000" "" string)
  ;;                      rest)))
  ;; (advice-add 'json-parse-buffer :around
  ;;             (lambda (oldfn &rest args)
  ;;               (save-excursion
  ;;                 (while (search-forward "\\u0000" nil t)
  ;;                   (replace-match "" nil t)))
  ;;               (apply oldfn args)))
  (cl-pushnew '((typescript-mode typescriptreact-mode) . ("typescript-language-server" "--stdio"))
              eglot-server-programs :test #'equal))

;; To improve eglot performance and prevent laggy typing
;; https://www.reddit.com/r/emacs/comments/16vixg6/how_to_make_lsp_and_eglot_way_faster_like_neovim/
;; https://www.reddit.com/r/emacs/comments/1447fy2/comment/jnescet/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
(fset #'jsonrpc--log-event #'ignore)
(setq eglot-events-buffer-size 0)

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
