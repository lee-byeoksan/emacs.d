;;; init-cpp.el --- C++ settings -*- lexical-binding: t; -*-

;;; Commentary:
;; C++ via tree-sitter modes.

;;; Code:

(use-package c++-ts-mode
  :ensure nil
  :mode ("\\.cc\\'" "\\.cpp\\'" "\\.cxx\\'" "\\.hh\\'" "\\.hpp\\'" "\\.hxx\\'"))

(provide 'init-cpp)

;;; init-cpp.el ends here
