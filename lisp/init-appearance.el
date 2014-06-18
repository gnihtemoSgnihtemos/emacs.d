;; disable splash
(setq inhibit-startup-message t)

;; hide menubar when not on os x
(when (and (fboundp 'menu-bar-mode) (not (eq system-type 'darwin)))
  (menu-bar-mode -1))

;; hide toolbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; hide scrollbar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; disable dialogs
(setq use-dialog-box nil)

;; highlight current line
(global-hl-line-mode 1)

;; set theme
(if (display-graphic-p)
    (progn (require-package 'color-theme-sanityinc-tomorrow)
           (load-theme 'sanityinc-tomorrow-night t))
  (set-face-background hl-line-face "gray13"))

;; display line numbers in prog-mode
(require 'linum)
(setq linum-format "%3d ")
(add-hook 'prog-mode-hook 'linum-mode)

;; highlight matching parentheses
(show-paren-mode 1)

;; highlight lines exceeding 80 columns
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; disable word wrapping
(setq-default truncate-lines t)

;; display line and column numbers in mode-line
(setq line-number-mode t
      column-number-mode t)

;; display date and time in mode-line
(setq display-time-default-load-average nil
      display-time-format "%t %a %b %d, %R")
(display-time)

(provide 'init-appearance)
