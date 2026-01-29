;;; init-c.el --- C settings -*- lexical-binding: t; -*-

;;; Commentary:
;; C via tree-sitter modes.

;;; Code:

(use-package c-ts-mode
  :ensure nil
  :mode ("\\.c\\'" "\\.h\\'"))

(provide 'init-c)

;;; init-c.el ends here
