;;; init-typescript.el --- TypeScript settings -*- lexical-binding: t; -*-

;;; Commentary:
;; TypeScript via tree-sitter modes.

;;; Code:

(use-package typescript-ts-mode
  :ensure nil
  :mode ("\\.ts\\'" "\\.tsx\\'"))

(provide 'init-typescript)

;;; init-typescript.el ends here
