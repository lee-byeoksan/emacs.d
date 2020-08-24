;; -*- lexical-binding: t -*-

(use-package org
  :ensure t)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/.orgs")
(defvar byeoksan/org-inbox (concat org-directory "/inbox.org"))
(defvar byeoksan/org-gtd (concat org-directory "/tasks.org"))

(setq org-indent-mode nil)
(setq org-special-ctrl-a/e t)
(setq org-default-notes-file byeoksan/org-inbox)
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "SCHED(s)" "DONE(d)")
        (sequence "NOTE")))
(setq org-capture-templates
      '(("t" "TODO" entry
         (file+headline "" "Tasks")
         (file "templates/todo.tpl")
         :kill-buffer t)
        ("n" "Fleeting note" entry
         (file+headline "" "Notes")
         (file "templates/flt-note.tpl")
         :kill-buffer t)
        ("N" "NEXT" entry
         (file byeoksan/org-gtd)
         (file "templates/next.tpl")
         :kill-buffer t)
        ))
(setq org-agenda-window-setup 'only-window)
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-files
      (list byeoksan/org-inbox
            byeoksan/org-gtd))

(setq org-agenda-custom-commands
      '(("n" "Agenda and all TODOs"
         ((agenda "")
          (todo "TODO")
          (todo "NEXT")
          (todo "NOTE")
          (todo "WAIT")
          (todo "SCHED")))))

(setq org-enforce-todo-dependencies t)
(setq org-agenda-dim-blocked-tasks 'invisible)

(setq org-tags-column -80)
(setq org-agenda-tags-column 140)
(set-face-attribute 'org-tag nil
                    :foreground "orange"
                    :weight 'bold)

(provide 'init-org)
