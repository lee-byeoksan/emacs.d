;; -*- lexical-binding: t -*-

(setq mode-hooks
      '(text-mode-hook
        prog-mode-hook
        org-mode-hook
        ))

(defun enable-line-numbers ()
  (display-line-numbers-mode 1))

(dolist (hook mode-hooks)
        (add-hook hook 'enable-line-numbers))

(provide 'init-lines)
