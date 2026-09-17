;;; init-github.el --- Github integration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'init-git)

(maybe-require-package 'forge)
(maybe-require-package 'github-review)

(when (maybe-require-package 'flymake-actionlint)
  (add-hook 'yaml-mode-hook 'flymake-actionlint-action-load-when-actions-file))

(provide 'init-github)
;;; init-github.el ends here
