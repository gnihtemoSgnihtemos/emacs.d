;; install packages
(require-packages
 '(magit git-commit-mode git-rebase-mode gitconfig-mode gitignore-mode))

(require 'magit)
(require 'git-commit-mode)
(require 'git-rebase-mode)
(require 'gitconfig-mode)
(require 'gitignore-mode)
(require 'vc-git)

;; use appropiate git-mode for .gitconfig and .gitignore extensions
(add-to-list 'auto-mode-alist '("\\.gitignore\\'" . gitignore-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig\\'" . gitconfig-mode))

;; magit keybinding
(global-set-key (kbd "C-x m") 'magit-status)

;; magit blame keybinding
(global-set-key (kbd "C-c b") 'magit-blame-mode)

(defun magit-visit-item-noselect (&optional other-window)
  "Visit current item, but don't select it."
  (interactive "P")
  (let ((current-window (selected-window)))
    (magit-visit-item other-window)
    (select-window current-window)))

(defun magit-stage-line-at-point ()
  "Stage the current line or region."
  (interactive)
  (if (use-region-p)
      (magit-stage-item)
    (let ((current-line (line-number-at-pos)))
      (save-excursion
        (beginning-of-line)
        (set-mark (line-end-position))
        (magit-stage-item))
      (goto-char (point-min))
      (forward-line (1- current-line)))))

(add-hook 'magit-status-mode-hook
          (lambda ()
            ;; make C-o and o behave as in dired
            (define-key magit-status-mode-map (kbd "C-o")
              'magit-visit-item-noselect)
            (define-key magit-status-mode-map (kbd "o")
              'magit-visit-item)
            ;; stage single line with C-c 1
            (define-key magit-status-mode-map (kbd "C-c 1")
              'magit-stage-line-at-point)))

(defun git-root ()
  "Find the git repository root of the visiting file."
  (interactive)
  (if buffer-file-name
      (let ((git-root (vc-git-root buffer-file-name)))
        (if git-root
            (let ((git-root-file-name (directory-file-name git-root)))
              (message "git repository: %s (%s)"
                       (file-name-nondirectory git-root-file-name)
                       git-root-file-name))
          (message "%s is not in a git repository" buffer-file-name)))
    (message "Buffer is not visiting a file")))

;; show current git repo
(global-set-key (kbd "C-c d") 'git-root)

(provide 'init-git)
