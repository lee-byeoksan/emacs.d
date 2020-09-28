;;; init-cc.el --- Configure cc mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'cc-mode)
(add-to-list 'c-default-style '(c-mode . "stroustrup"))
(add-to-list 'c-default-style '(c++-mode . "stroustrup"))

(provide 'init-cc)
;;; init-cc.el ends here
