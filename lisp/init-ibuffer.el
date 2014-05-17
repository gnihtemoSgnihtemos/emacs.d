;; install package
(require-package 'ibuffer-vc)

;; load ibuffer and ibuffer-vc
(require 'ibuffer)
(require 'ibuffer-vc)

;; keep buffer list up to date and group ibuffer by repository root
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-auto-mode)
            (ibuffer-vc-set-filter-groups-by-vc-root)))

;; use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; disable confirmation for killing unmodified buffers
(setq ibuffer-expert t)

(provide 'init-ibuffer)