# Minimal Emacs config

Lightweight Emacs 29+ configuration focused on code editing (TS/JS/C/C++/Elisp),
LSP via eglot, modern completion, git, org/org-roam, and terminal usage.

## Structure

- `early-init.el`
- `init.el`
- `lisp/` (all `init-*.el` modules)

## Requirements

- Emacs 29+
- `node` + `typescript-language-server`
- `clangd`
- `git`
- `rg`
- `libvterm` build dependencies for `vterm`

## Org

Org files live in `~/.orgs`.
