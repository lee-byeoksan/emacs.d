;;; init.el --- Minimal Emacs configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Lightweight, modular configuration with use-package only.

;;; Code:

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'init-ui)
(require 'init-edit)
(require 'init-completion)

(when (eq system-type 'darwin)
  (require 'init-macos))
(when (eq system-type 'gnu/linux)
  (require 'init-linux))

(require 'init-eglot)
(require 'init-git)
(require 'init-vterm)

(require 'init-org)
(require 'init-org-roam)

(require 'init-javascript)
(require 'init-typescript)
(require 'init-c)
(require 'init-cpp)
(require 'init-elisp)

(provide 'init)

;;; init.el ends here
