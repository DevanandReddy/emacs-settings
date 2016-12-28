;; Also you could setup any combination (for example M-TAB)
;;for invoking auto-complete:
(require 'auto-complete-config)

;; (add-to-list 'ac-dictionary-directories "elpa/auto-complete-20150322.813/dict")
(ac-config-default)
(require 'go-autocomplete)
;;(require 'go-mode-load)


;;Also you could setup any combination (for example M-TAB)
;;for invoking auto-complete:

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;;(require 'go-direx)
(setq gofmt-command "goimports")

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
      (local-set-key (kbd "C-c C-p") 'go-play-region)))

(add-hook 'go-mode-hook (lambda ()
      (local-set-key (kbd "C-c C-a") 'go-import-add)))
(add-hook 'go-mode-hook (lambda ()
      (local-set-key (kbd "C-c C-r") 'go-rename)))
(add-hook 'go-mode-hook (lambda ()
      (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ()
          (local-set-key (kbd "C-c d") 'godoc-at-point)))
(add-hook 'go-mode-hook (lambda ()
      (local-set-key (kbd "C-c C-i C-f") 'gotags-file)))
(add-hook 'go-mode-hook (lambda ()
      (local-set-key (kbd "C-c C-i C-p") 'gotags-package)))

(add-hook 'go-mode-hook (lambda ()
      (go-eldoc-setup)))

(setq compile-command "gb build")
(add-hook 'go-mode-hook (lambda ()
      (local-set-key (kbd "C-c C-c") 'compile)))

(defun gb-list--call ()
  "Call gb list, parse the buffer and build a big string"
  (let ((outbuf (get-buffer-create "*gb-list*"))
    (coding-system-for-read 'utf-8)
    (coding-system-for-write 'utf-8))
    (with-current-buffer outbuf
      (erase-buffer))
    (call-process "gb"
      nil
      outbuf
      nil
      "list")
    (with-current-buffer outbuf
      (replace-regexp-in-string "\n" "," (buffer-string)))
    ))

;; This is for gb based projects.
(defun set-go-path-for-gb ()
  (let ((cwd (getenv "PWD")))
    (if (file-exists-p (concat cwd "/src"))

      (setenv "GOPATH"
      (concat cwd ":"
          cwd "/vendor")))
    (require 'go-guru)
    (setq go-guru-scope (gb-list--call))
    (kill-buffer "*gb-list*")
 ))

(set-go-path-for-gb)
(with-eval-after-load 'go-mode
  (require 'go-autocomplete))


;;;; go.el ends here
