;;; init-completion.el --- Minibuffer completion configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Modern completion stack with fuzzy matching and rich annotations.
;; Uses vertico (UI) + orderless (matching) + marginalia (annotations)
;; + consult (enhanced commands) + embark (context actions).

;;; Code:

;; Vertico: Vertical completion UI
(use-package vertico
  :init
  (vertico-mode)
  :config
  ;; Number of candidates to display
  (setq vertico-count 20)
  ;; Cycle through candidates
  (setq vertico-cycle t))

;; Orderless: Space-separated fuzzy matching
(use-package orderless
  :config
  ;; Use orderless for completion matching
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil)
  ;; Use basic matching for file paths to preserve path separators
  (setq completion-category-overrides '((file (styles basic partial-completion)))))

;; Marginalia: Rich annotations in minibuffer
(use-package marginalia
  :init
  (marginalia-mode)
  :config
  ;; Show annotations in completion candidates
  ;; Displays file sizes, dates, documentation strings, etc.
  (setq marginalia-align 'right))

;; Consult: Enhanced search and navigation commands
(use-package consult
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-c k" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)
         ("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("C-x r b" . consult-bookmark)
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g o" . consult-outline)
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)
         ("M-s e" . consult-isearch-history)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi))
  :config
  ;; Preview settings: delay before showing preview
  (setq consult-preview-key 'any)
  ;; Narrowing prefixes for consult-buffer
  (setq consult-narrow-key "<"))

;; Embark: Context actions on completion candidates
(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Embark-Consult integration
(use-package embark-consult
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(provide 'init-completion)
;;; init-completion.el ends here
