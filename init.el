;; add ~/.emacs.d/lisp to load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; load files
(require 'init-package)
(require 'init-appearance)
(require 'init-evil-mode)
(require 'init-sane-defaults)
(require 'init-mac)
(require 'init-ido)
(require 'init-server)
(require 'init-go-mode)
(require 'init-yaml-mode)
(require 'init-markdown-mode)
(require 'init-org)
