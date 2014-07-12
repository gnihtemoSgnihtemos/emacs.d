;; install packages
(require-packages
 '(flx-ido ido-vertical-mode ido-ubiquitous find-file-in-repository smex))

;; load ido
(require 'ido)
(ido-mode 1)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10)

;; load flx-ido
(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; vertical mode for ido
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;; load ido-ubiquitous (a better ido-everywhere)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; find file in repository
(global-set-key (kbd "C-x f") 'find-file-in-repository)

;; smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(provide 'init-ido)
