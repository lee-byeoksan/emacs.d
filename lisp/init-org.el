;; -*- mode: elisp

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-indent-mode t)
(setq org-special-ctrl-a/e t)
(setq org-directory "~/.orgs")

(provide 'init-org)
