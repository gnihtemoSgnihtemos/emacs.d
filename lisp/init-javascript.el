(use-package js
  :ensure nil

  :init
  ;; set indent level to 2
  (setq-default js-indent-level 2)

  :mode
  ;; use js-mode for json and jshint
  ("\\.\\(json\\|jshintrc\\)\\'" . js-mode)

  :config
  (add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-c p") 'jq-reformat))))

;; use jq for reformatting json
(defun jq-reformat-region (begin end)
  (interactive "r")
  (if (executable-find "jq")
      (let* ((tmpfile (make-temp-file "jq"))
             (errbuf (get-buffer-create "*jq errors*"))
             (result (call-process-region begin end "jq" nil
                                          `((:file ,tmpfile) ,tmpfile) nil
                                          "--monochrome-output" "--ascii-output"
                                          "."))
             (success (zerop result))
             (resbuf (if success (current-buffer) errbuf)))
        (with-current-buffer resbuf
          (insert-file-contents tmpfile nil nil nil t))
        (if success
            (progn
              (kill-buffer errbuf)
              (message "Reformatted JSON"))
          (message "Failed to reformat JSON. Check errors for details"))
        (delete-file tmpfile))
    (message "Could not find jq in PATH.")))

(defun jq-reformat ()
  (interactive)
  (if (use-region-p)
      (jq-reformat-region (region-beginning) (region-end))
    (jq-reformat-region (point-min) (point-max))))

(provide 'init-javascript)
