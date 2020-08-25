;;; init-lines.el --- Configurations on lines -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun enable-line-numbers ()
  (display-line-numbers-mode 1))

(let ((mode-hooks '(text-mode-hook
                    prog-mode-hook
                    org-mode-hook)))
  (dolist (hook mode-hooks)
    (add-hook hook 'enable-line-numbers)))

(provide 'init-lines)
;;; init-lines.el ends here
