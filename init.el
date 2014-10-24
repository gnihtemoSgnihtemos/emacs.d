;; add ~/.emacs.d/lisp to load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; load files
(require 'init-package)
(require 'init-appearance)
(require 'init-sane-defaults)
(when (eq system-type 'darwin)
  (require 'init-mac))
(require 'init-ido)
(require 'init-projectile)
(require 'init-server)
(require 'init-go-mode)
(require 'init-yaml-mode)
(require 'init-markdown-mode)
(require 'init-javascript)
(require 'init-rainbow-delimiters)
(require 'init-ibuffer)
(require 'init-sessions)
(require 'init-git)
(require 'init-lisp)
(require 'init-editing)
(require 'init-ag)
(require 'init-expand-region)
(require 'init-python-mode)
(require 'init-web-mode)
(require 'init-shell)
(require 'init-imenu)
(require 'init-dockerfile)
(require 'init-tramp)

;; local settings (optional)
(require 'init-local nil t)
