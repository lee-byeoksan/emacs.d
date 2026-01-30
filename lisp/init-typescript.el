;;; init-typescript.el --- TypeScript configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Configure TypeScript development environment with LSP support.
;; Supports both typescript-mode and tree-sitter based typescript-ts-mode.

;;; Code:

(require 'init-lsp)

;; Use tree-sitter mode if available (Emacs 29+ with tree-sitter support)
;; Otherwise fall back to typescript-mode
(if (and (fboundp 'treesit-available-p)
         (treesit-available-p))
    (progn
      ;; Tree-sitter based modes (built-in in Emacs 29+)
      (use-package typescript-ts-mode
        :ensure nil  ; Built-in
        :mode (("\\.ts\\'" . typescript-ts-mode)
               ("\\.tsx\\'" . tsx-ts-mode))
        :config
        ;; Indentation level for TypeScript code
        (setq typescript-ts-mode-indent-offset 2)))
  
  ;; Traditional typescript-mode as fallback
  (use-package typescript-mode
    :mode (("\\.ts\\'" . typescript-mode)
           ("\\.tsx\\'" . typescript-mode))
    :config
    ;; Indentation level for TypeScript code
    (setq typescript-indent-level 2)))

;; Configure LSP based on preference
(pcase lsp-client-preference
  ('eglot
   ;; Eglot configuration for TypeScript
   ;; Requires typescript-language-server: npm install -g typescript-language-server typescript
   (with-eval-after-load 'eglot
     (add-to-list 'eglot-server-programs
                  '((typescript-mode typescript-ts-mode tsx-ts-mode)
                    . ("typescript-language-server" "--stdio"))))
   
   ;; Enable eglot automatically for TypeScript files
   (dolist (mode '(typescript-mode typescript-ts-mode tsx-ts-mode))
     (add-hook (intern (format "%s-hook" mode)) #'eglot-ensure)))
  
  ('lsp-mode
   ;; LSP Mode configuration for TypeScript
   ;; Requires typescript-language-server: npm install -g typescript-language-server typescript
   (with-eval-after-load 'lsp-mode
     ;; Enable lsp-mode automatically for TypeScript files
     (dolist (mode '(typescript-mode typescript-ts-mode tsx-ts-mode))
       (add-hook (intern (format "%s-hook" mode)) #'lsp-deferred))
     
     ;; TypeScript-specific LSP settings
     (setq lsp-typescript-suggest-complete-function-calls t)
     (setq lsp-typescript-format-enable t))))

(provide 'init-typescript)
;;; init-typescript.el ends here
