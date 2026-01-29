;;; init-javascript.el --- JavaScript settings -*- lexical-binding: t; -*-

;;; Commentary:
;; JavaScript via tree-sitter modes.

;;; Code:

(use-package js-ts-mode
  :ensure nil
  :mode ("\\.js\\'" "\\.mjs\\'" "\\.cjs\\'" "\\.jsx\\'"))

(provide 'init-javascript)

;;; init-javascript.el ends here
