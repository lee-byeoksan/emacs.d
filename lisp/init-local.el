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
  (require-package 'vterm)
(with-eval-after-load 'vterm
  (setq vterm-always-compile-module t)
  (define-key vterm-mode-map (kbd "C-]") 'vterm--self-insert)
  (define-key vterm-mode-map (kbd "C-u") 'vterm--self-insert))


;; Org Roam
(require-package 'org-roam)
;; (require-package 'org-roam-dailies)

;; (with-eval-after-load 'org-roam
;;   )
(setq org-roam-v2-ack t)
(setq org-roam-directory "~/.orgs/roam")
(setq org-roam-completion-everywhere t)
(global-set-key (kbd "C-c n l") 'org-roam-buffer-toggle)
(global-set-key (kbd "C-c n f") 'org-roam-node-find)
(global-set-key (kbd "C-c n i") 'org-roam-node-insert)
(org-roam-db-autosync-enable)


;; (setq org-roam-dailies-directory "daily")
;; (setq org-roam-capture-templates
;;       '(("d" "default" plain "%?" :target
;;          (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
;;          :unnarrowed t)
;;         ))


;; Programming
(require-package 'eglot)


;; Typescript
(add-hook 'typescript-mode 'eglot-ensure)


;; Protobuf
(require-package 'protobuf-mode)

(provide 'init-local)
;;; init-local.el ends here
