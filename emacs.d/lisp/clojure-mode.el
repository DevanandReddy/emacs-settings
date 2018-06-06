(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-require-match 'never)
(setq company-auto-complete t)

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'clojure-mode-hook (lambda ()
                                 (smartparens-mode)
                                 (cider-mode)))
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
