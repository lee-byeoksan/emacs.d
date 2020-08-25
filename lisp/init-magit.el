;;; init-magit --- Set up configurations for magit -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-x g") 'magit-status)

(global-magit-file-mode t)

(provide 'init-magit)
;;; init-magit.el ends here
