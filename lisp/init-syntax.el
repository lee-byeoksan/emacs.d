;;; init-syntax.el --- Syntax highlight configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Configure general programming language syntax

;;; Code:

;; Below lists are ABI version 14
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash" "v0.23.3" "src")
        (c "https://github.com/tree-sitter/tree-sitter-c" "v0.23.6" "src")
	(css "https://github.com/tree-sitter/tree-sitter-css" "v0.23.2" "src" )
	(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))

(defun treesit-install-language-grammar-if-necessary (lng)
  (unless (treesit-language-available-p lng) (treesit-install-language-grammar lng)))

;; Install grammars
(mapc #'treesit-install-language-grammar-if-necessary (mapcar #'car treesit-language-source-alist))

(provide 'init-syntax)
;;; init-syntax.el ends here
