(require-package 'paredit)

(require 'paredit)

;; enable paredit
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(provide 'init-lisp)
