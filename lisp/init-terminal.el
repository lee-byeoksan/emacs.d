;; -*- mode: elisp -*-

(add-hook 'term-mode-hook
          (lambda ()
            (display-line-numbers-mode 0)
            (setq-local global-hl-line-mode nil)))

(provide 'init-terminal)
