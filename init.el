;; init.el

;; Package System
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; General Settings
(menu-bar-mode 0)
(if window-system
    (tool-bar-mode 0))

(transient-mark-mode 1)
(global-font-lock-mode t)
(global-display-line-numbers-mode 1)
(global-set-key (kbd "<f8>") 'display-line-numbers-mode)
(global-hl-line-mode)
(setq-default indent-tabs-mode nil)

;;; Added by Custom
(custom-set-variables
 '(custom-enabled-themes (quote (misterioso)))
 '(winner-mode t))
(custom-set-faces)

;; Personal Settings
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(if (eq system-type 'darwin)
    (require 'init-mac))
(require 'init-terminal)
(require 'init-org)
(require 'init-python)
