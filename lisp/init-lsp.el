;;; init-lsp.el --- LSP client configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Configure Language Server Protocol (LSP) support.
;; Supports both eglot (built-in since Emacs 29) and lsp-mode.
;; Set `lsp-client-preference' to switch between them.

;;; Code:

(defcustom lsp-client-preference 'eglot
  "LSP client to use for language server integration.
Options:
  - `eglot'    Built-in LSP client (default, minimal and fast)
  - `lsp-mode' Feature-rich third-party LSP client"
  :type '(choice (const :tag "Eglot (built-in)" eglot)
                 (const :tag "LSP Mode" lsp-mode))
  :group 'lsp)

(pcase lsp-client-preference
  ('eglot
   ;; Eglot: Built-in LSP client (Emacs 29+)
   ;; Minimal UI, uses built-in features (xref, flymake, eldoc)
   (use-package eglot
     :ensure nil  ; Built-in, no need to install
     :commands eglot eglot-ensure
     ;; To enable eglot automatically, add hooks like:
     ;; :hook (python-mode . eglot-ensure)
     :config
     ;; Shutdown server when last buffer is killed to save resources
     (setq eglot-autoshutdown t)
     
     ;; Sync settings to server immediately for faster feedback
     (setq eglot-send-changes-idle-time 0)))
  
  ('lsp-mode
   ;; LSP Mode: Feature-rich third-party LSP client
   ;; Provides extensive UI features and integrations
   (use-package lsp-mode
     :commands (lsp lsp-deferred)
     ;; To enable lsp-mode automatically, add hooks like:
     ;; :hook (python-mode . lsp-deferred)
     :config
     ;; Performance tuning: increase read process output max
     ;; LSP servers can send large responses
     (setq read-process-output-max (* 1024 1024))
     
     ;; Disable features that may cause performance issues
     (setq lsp-enable-file-watchers nil)
     (setq lsp-enable-folding nil)
     
     ;; Show documentation in eldoc
     (setq lsp-eldoc-enable-hover t)
     
     ;; Breadcrumb navigation at top of buffer
     (setq lsp-headerline-breadcrumb-enable nil))
   
   ;; Optional: LSP UI for better visual feedback
   (use-package lsp-ui
     :after lsp-mode
     :commands lsp-ui-mode
     :config
     ;; Sideline shows diagnostic and info inline
     (setq lsp-ui-sideline-enable t)
     (setq lsp-ui-sideline-show-diagnostics t)
     (setq lsp-ui-sideline-show-hover nil)
     
     ;; Doc popup shows documentation
     (setq lsp-ui-doc-enable t)
     (setq lsp-ui-doc-position 'at-point)
     (setq lsp-ui-doc-delay 0.5))))

(provide 'init-lsp)
;;; init-lsp.el ends here
