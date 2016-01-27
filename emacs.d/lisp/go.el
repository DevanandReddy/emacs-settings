;; Also you could setup any combination (for example M-TAB)
;;for invoking auto-complete:
(require 'auto-complete-config)

;; (add-to-list 'ac-dictionary-directories "elpa/auto-complete-20150322.813/dict")
(ac-config-default)
(require 'go-autocomplete)
;;(require 'go-mode-load)
(add-to-list 'load-path "/home/gdr/Projects/go-projects/src/github.com/dougm/goflymake")
;; (require 'go-flymake)
(require 'go-flycheck)

;;Also you could setup any combination (for example M-TAB)
;;for invoking auto-complete:

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;;(require 'go-direx)

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
              (local-set-key (kbd "C-c C-a") 'go-import-add)))
(add-hook 'go-mode-hook (lambda ()
              (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
              (local-set-key (kbd "C-c i") 'go-goto-imports)))

(setq compile-command "go build")
(add-hook 'go-mode-hook (lambda ()
              (local-set-key (kbd "C-c C-c") 'compile)))
