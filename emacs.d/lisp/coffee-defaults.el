;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

(require 'whitespace)
(add-hook 'coffee-mode-hook
          (function (lambda()
                      (whitespace-mode t))))

(custom-set-variables
 '(coffee-args-compile (quote ("-c" "--bare")))
 '(coffee-tab-width 4)
 '(column-number-mode t))

(add-hook 'coffee-mode-hook (lambda ()
                              (local-set-key (kbd "C-c C-s") 'coffee-compile-region)))

(add-hook 'coffee-mode-hook (lambda ()
                              (local-set-key (kbd "C-c C-f") 'coffee-compile-buffer)))


(add-to-list 'auto-mode-alist '("\\.litcoffee\\'" . coffee-mode))
