;; use soft tabs
(setq-default indent-tabs-mode nil)

;; bind return to newline-and-indent
(global-set-key (kbd "RET") 'newline-and-indent)

;; make prompts accept y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; no confirmation for non-existent files or buffers
(setq confirm-nonexistent-file-or-buffer nil)

;; disable audible bell
(setq ring-bell-function #'ignore)

;; scroll one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; disable scroll acceleration
(setq mouse-wheel-progressive-speed nil)

;; reload buffers automatically when files change on disk
(global-auto-revert-mode t)

;; reload dired buffers automatically and be quit about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; integrate with X clipboard
(setq x-select-enable-clipboard t)

;; move deleted files to trash
(setq delete-by-moving-to-trash t)

;; show keystrokes immediately
(setq echo-keystrokes 0.1)

;; add directory to buffer name if filename is not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; tetris score file
(setq tetris-score-file (expand-file-name "tetris" user-emacs-directory))

(provide 'init-sane-defaults)
