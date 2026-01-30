# Emacs Configuration
This emacs configuration supports Emacs 29+, mainly used as GUI application.

## Code Structure
Each Emacs Lisp code SHOULD follow the below structure.
```elisp
;;; <filename> --- <description> <modeline>
;;; Commentary:
[Code description for humans]

;;; Code:

[Body]

(provide <feature>)
;;; <filename> ends here
```
- The default modeline is "-*- lexical-binding: t -*-". If not specified, use the default modeline.
- Feature name MUST be same as filename. (`'init` for init.el)

### Example
```elisp
;;; init.el --- Load configuration files -*- lexical-binding: t -*-
;;; Commentary:
;; This is the entry point of Emacs configuration

;;; Code:

(provide 'init)
;;; init.el ends here

```

## Directory Organization
- `early-init.el` is loaded before package system and GUI is initialized.
- `init.el` is the main entry point of configuration.
- `lisp/` contains every single configuration file.
  * No subdirectories
  * Filenames MUST prefixed by `init-` (e.g., init-git.el).
- Every package MUST be installed in Emacs version isolated directory with name starting with `elpa-`. For example, packages installed with Emacs 29.1 go into `elpa-29.1`.
