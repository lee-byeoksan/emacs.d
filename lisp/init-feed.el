;;; init-feed.el --- Configure RSS feed -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package elfeed
  :ensure t
  :config
  (global-set-key (kbd "C-x w") 'elfeed)
  (setq elfeed-feeds
        '("https://bartoszmilewski.com/feed/"))
  )

(provide 'init-feed)
;;; init-feed.el ends here
