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
              (local-set-key (kbd "C-c C-i") 'gotags-helm)))

(add-hook 'go-mode-hook (lambda ()
              (go-eldoc-setup)))

(setq compile-command "gb build")
(add-hook 'go-mode-hook (lambda ()
              (local-set-key (kbd "C-c C-c") 'compile)))

;; This is for gb based projects.
(defun set-go-path-for-gb ()
  (let ((cwd (getenv "PWD")))
    (if (file-exists-p (concat cwd "/src"))
      (setenv "GOPATH"
              (concat cwd ":"
                      cwd "/vendor")))
    (require 'go-guru)
    (setq go-guru-scope "git.gdsx.com/tla/go-conquest/command/conquestd")
    )
  )

(set-go-path-for-gb)
(with-eval-after-load 'go-mode
  (require 'go-autocomplete))
