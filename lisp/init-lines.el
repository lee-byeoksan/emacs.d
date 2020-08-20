;; -*- lexical-binding: t -*-

(defun enable-line-numbers ()
  (display-line-numbers-mode 1))

(let ((mode-hooks '(text-mode-hook
                    prog-mode-hook
                    org-mode-hook)))
  (dolist (hook mode-hooks)
    (add-hook hook 'enable-line-numbers)))

(provide 'init-lines)
