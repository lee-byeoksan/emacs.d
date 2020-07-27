;; init.el

;; Package System
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; General Settings
(menu-bar-mode 0)
(if window-system
    (tool-bar-mode 0))

(defun reload-init ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(transient-mark-mode 1)
(global-font-lock-mode t)
(global-display-line-numbers-mode 1)
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "<f8>") 'display-line-numbers-mode)
(global-set-key (kbd "<f12>") 'reload-init)
(global-hl-line-mode)
(setq-default indent-tabs-mode nil)
(setq show-trailing-whitespace t)

(require 'ido)
(ido-mode t)
(ido-everywhere)
(setq ido-enable-flex-matching t)

;;; Added by Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(package-selected-packages (quote (use-package)))
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Personal Settings
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(if (eq system-type 'darwin)
    (require 'init-mac))
(require 'init-terminal)
(require 'init-org)
(require 'init-python)
