;;; init-code.el --- Code formatting and linting configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Configure code formatting, linting, and other code quality tools.

;;; Code:

;; Apheleia: Asynchronous code formatting
(use-package apheleia
  :config
  ;; Use npx for prettier - automatically tries local node_modules first,
  ;; then falls back to global installation
  (setf (alist-get 'prettier apheleia-formatters)
        '("npx" "prettier" "--stdin-filepath" filepath))

  ;; Enable apheleia globally
  ;; Formats files on save using the appropriate formatter
  (apheleia-global-mode +1))

(provide 'init-code)
;;; init-code.el ends here
