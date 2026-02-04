;;; init-vcs.el --- Version control system configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Configure version control tools, primarily Git integration via magit.
;; Includes diff highlighting and git status indicators.
;; Uses difftastic for structural side-by-side diff rendering.

;;; Code:

;; Magit: Git porcelain for Emacs
(use-package magit
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch)
   ("C-c M-g" . magit-file-dispatch))
  :config
  ;; Show fine differences in selected hunks
  (setq magit-diff-refine-hunk t)
  ;; Show word-granularity differences within diff hunks
  (setq magit-diff-refine-ignore-whitespace nil)
  ;; Display buffer showing the thing at point in fullframe
  (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  ;; Automatically save file-visiting buffers when appropriate
  (setq magit-save-repository-buffers 'dontask))

;; Difftastic: Structural side-by-side diff tool
;; Requires difftastic CLI tool: brew install difftastic (macOS)
;; Based on https://tsdh.org/posts/2022-08-01-difftastic-diffing-with-magit.html

(defun init-vcs--magit-with-difftastic (buffer command)
  "Run COMMAND with GIT_EXTERNAL_DIFF=difft then show result in BUFFER."
  (switch-to-buffer buffer)
  (delete-other-windows)
  (let* ((difft-width (window-body-width))
         (process-environment
          (append (list (format "DFT_WIDTH=%d" difft-width)
                        "DFT_DISPLAY=side-by-side-show-both"
                        "DFT_COLOR=always"
                        "GIT_EXTERNAL_DIFF=difft")
                  process-environment))
         (default-directory (magit-toplevel)))
    (setq buffer-read-only nil)
    (erase-buffer)
    (setq-local truncate-lines t)
    (setq-local word-wrap nil)
    (make-process
     :name (buffer-name buffer)
     :buffer buffer
     :command command
     :connection-type 'pty
     :noquery t
     :sentinel (lambda (proc event)
                 (when (eq (process-status proc) 'exit)
                   (with-current-buffer (process-buffer proc)
                     (goto-char (point-min))
                     (ansi-color-apply-on-region (point-min) (point-max))
                     (setq buffer-read-only t)
                     (view-mode)
                     (goto-char (point-min))))))))

(defun init-vcs-magit-show-with-difftastic (rev)
  "Show the result of \"git show REV\" with difftastic."
  (interactive
   (list (or
          (when (boundp 'rev) rev)
          (and (not current-prefix-arg)
               (or (magit-thing-at-point 'git-revision t)
                   (magit-branch-or-commit-at-point)))
          (magit-read-branch-or-commit "Revision"))))
  (if (not rev)
      (error "No revision specified")
    (init-vcs--magit-with-difftastic
     (get-buffer-create (concat "*git show difftastic " rev "*"))
     (list "git" "--no-pager" "show" "--ext-diff" rev))))

(defun init-vcs-magit-diff-with-difftastic (arg)
  "Show the result of \"git diff ARG\" with difftastic."
  (interactive
   (list (or
          (when (boundp 'range) range)
          (and current-prefix-arg
               (magit-diff-read-range-or-commit "Range"))
          (pcase (magit-diff--dwim)
            ('unmerged (error "unmerged is not yet implemented"))
            ('unstaged nil)
            ('staged "--cached")
            (`(stash . ,value) (error "stash is not yet implemented"))
            (`(commit . ,value) (format "%s^..%s" value value))
            ((and range (pred stringp)) range)
            (_ (magit-diff-read-range-or-commit "Range/Commit"))))))
  (let ((name (concat "*git diff difftastic"
                      (if arg (concat " " arg) "")
                      "*")))
    (init-vcs--magit-with-difftastic
     (get-buffer-create name)
     `("git" "--no-pager" "diff" "--ext-diff" ,@(when arg (list arg))))))

(defun init-vcs-magit-diff-file-with-difftastic (range file)
  "Show the result of \"git diff RANGE -- FILE\" with difftastic.
If called from magit-status buffer, use the file at point.
Otherwise, use the current buffer's file.
With prefix argument, prompt for RANGE."
  (interactive
   (let* ((file (or (magit-file-at-point)
                    (buffer-file-name)
                    (read-file-name "File: ")))
          (range (if current-prefix-arg
                     (magit-diff-read-range-or-commit "Range")
                   (pcase (magit-diff--dwim)
                     ('unstaged nil)
                     ('staged "--cached")
                     (`(commit . ,value) (format "%s^..%s" value value))
                     ((and range (pred stringp)) range)
                     (_ nil)))))
     (list range file)))
  (unless file
    (error "No file specified"))
  ;; Convert to repository-relative path
  (let* ((git-root (magit-toplevel))
         (relative-file (if (file-name-absolute-p file)
                            (file-relative-name file git-root)
                          file))
         (name (concat "*git diff difftastic "
                       (if range (concat range " ") "")
                       (file-name-nondirectory file)
                       "*")))
    (init-vcs--magit-with-difftastic
     (get-buffer-create name)
     `("git" "--no-pager" "diff" "--ext-diff"
       ,@(when range (list range))
       "--" ,relative-file))))

;; Add difftastic commands to magit-diff transient
(with-eval-after-load 'magit-diff
  (transient-append-suffix 'magit-diff '(-1 -1)
    [("D" "Difftastic diff (dwim)" init-vcs-magit-diff-with-difftastic)
     ("S" "Difftastic show" init-vcs-magit-show-with-difftastic)
     ("F" "Difftastic diff file" init-vcs-magit-diff-file-with-difftastic)]))

;; Add difftastic file command to magit-file-dispatch transient
(with-eval-after-load 'magit
  (transient-append-suffix 'magit-file-dispatch "d"
    '("D" "Difftastic diff file" init-vcs-magit-diff-file-with-difftastic)))

;; Show git diff indicators in the fringe
(use-package diff-hl
  :config
  ;; Enable diff-hl globally
  (global-diff-hl-mode)
  ;; Enable diff-hl in dired
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  ;; Update diff-hl after magit operations
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(provide 'init-vcs)
;;; init-vcs.el ends here
