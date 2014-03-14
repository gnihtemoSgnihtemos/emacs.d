;; disable splash
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; hide toolbar
(tool-bar-mode -1)

;; hide scrollbar
(scroll-bar-mode -1)

;; set theme
(require-package 'solarized-theme)
(load-theme 'solarized-dark t)

;; display line numbers
(global-linum-mode 1)
(setq linum-format " %d ")

;; highlight current line
(global-hl-line-mode)

;; highlight matching parentheses
(show-paren-mode 1)

;; highlight lines exceeding 80 columns
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; disable word wrapping
(setq-default truncate-lines 1)

(provide 'init-appearance)