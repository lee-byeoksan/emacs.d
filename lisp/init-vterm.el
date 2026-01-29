;;; init-vterm.el --- vterm integration -*- lexical-binding: t; -*-

;;; Commentary:
;; Terminal support via vterm.

;;; Code:

(use-package vterm
  :commands vterm
  :custom
  (vterm-max-scrollback 5000))

(provide 'init-vterm)

;;; init-vterm.el ends here
