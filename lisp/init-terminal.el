;; -*- mode: elisp -*-

(add-hook 'term-mode-hook
          (lambda ()
            (display-line-numbers-mode 0)
            (hl-line-mode -1)))

(provide 'init-terminal)
