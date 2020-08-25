;;; initl.el --- Emacs custom configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Customized configurations to other file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Package System
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; General Settings
(setq-default major-mode 'indented-text-mode)
(setq system-time-locale "C")
(set-language-environment "UTF-8")
(set-input-method 'korean-hangul390)
(menu-bar-mode 0)
(if window-system
    (tool-bar-mode 0))

(defun reload-init ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(transient-mark-mode 1)
(global-font-lock-mode t)
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "<f8>") 'display-line-numbers-mode)
(global-set-key (kbd "<f12>") 'reload-init)
(global-hl-line-mode)
(set-face-attribute 'hl-line nil
                    :inherit nil
                    :underline "red"
                    :background nil)
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "M-S-<up>") 'move-line-up)
(global-set-key (kbd "M-S-<down>") 'move-line-down)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default show-trailing-whitespace t)

(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-saves/" t)))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(use-package disable-mouse
  :ensure t
  :config
  (global-disable-mouse-mode))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x b") 'counsel-switch-buffer)
  (global-set-key (kbd "M-s .") 'swiper-thing-at-point))

(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

(scroll-bar-mode 0)

(use-package fill-column-indicator
  :ensure t
  :config
  (setq-default fci-rule-column 80)
  )

(load-theme 'misterioso)
(enable-theme 'misterioso)
(winner-mode t)

;; reference: https://crazia.tistory.com/entry/Emacs-24x-%EB%B2%84%EC%A0%BC-%ED%95%9C%EA%B8%80-%ED%8F%B0%ED%8A%B8-%EC%84%A4%EC%A0%95-orgmode-%EC%9D%98-%ED%95%9C%EA%B8%80-%ED%85%8C%EC%9D%B4%EB%B8%94-%EA%B9%A8%EC%A7%80%EC%A7%80-%EC%95%8A%EA%B2%8C-%EB%B3%B4%EC%9D%B4%EA%B8%B0
(when (eq system-type 'gnu/linux)
  (set-face-font 'default (font-spec :name "D2Coding":size 18)))

(when (eq system-type 'darwin)
  (set-fontset-font t 'hangul (font-spec :name "Arial Unicode MS"))
  (setq face-font-rescale-alist '(("Arial Unicode MS" . 1.25))))

(require 'ido)
(ido-mode t)
(ido-everywhere)
(setq ido-enable-flex-matching t)

(use-package magit
  :ensure t)

;; Should be placed after color scheme configuration
(set-face-attribute 'mode-line nil
                    :inherit nil
                    :background "#56b1f7")
(display-time-mode)
(column-number-mode)

;; Personal Settings
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-magit)

(require 'init-lines)
(if (eq system-type 'darwin)
    (require 'init-mac))
(require 'init-terminal)
(require 'init-org)
(require 'init-python)

(require 'init-lsp)
;;; init.el ends here
