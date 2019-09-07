(use-package lsp-mode
  :commands (lsp lsp-deferred))

(add-hook 'go-mode-hook #'lsp-deferred)

;; optional - provides fancier overlays
(use-package lsp-ui
  :commands lsp-ui-mode)

;; if you use company-mode for completion (otherwise, complete-at-point works out of the box):
(use-package company-lsp
         :commands company-lsp)

(add-hook 'go-mode-hook 'flycheck-mode)

(setq compile-command "go build ./...")
(add-hook 'go-mode-hook (lambda ()
      (local-set-key (kbd "C-c C-c") 'compile)))


(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;;; lsp.el ends here
