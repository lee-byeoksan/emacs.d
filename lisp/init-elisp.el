;;; init-elisp.el --- Emacs Lisp settings -*- lexical-binding: t; -*-

;;; Commentary:
;; Emacs Lisp defaults.

;;; Code:

(use-package elisp-mode
  :ensure nil
  :mode ("\\.el\\'" . emacs-lisp-mode))

(provide 'init-elisp)

;;; init-elisp.el ends here
