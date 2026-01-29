;;; init-completion.el --- Completion stack -*- lexical-binding: t; -*-

;;; Commentary:
;; Minibuffer and in-buffer completion using modern packages.

;;; Code:

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package consult)

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-quit-no-match 'separator)
  :init
  (global-corfu-mode))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

(provide 'init-completion)

;;; init-completion.el ends here
