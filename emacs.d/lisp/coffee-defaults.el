;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

(require 'whitespace)
(add-hook 'coffee-mode-hook
	  (function (lambda()
		      (whitespace-mode t))))

;; This gives you a tab of 2 spaces
(custom-set-variables
 '(coffee-tab-width 4)
 '(coffee-args-compile '("-c" "--bare")))

(setq coffee-indent-tabs-mode 1)

(add-hook 'coffee-mode-hook (lambda ()
			      (local-set-key (kbd "C-c C-s") 'coffee-compile-region)))

(add-hook 'coffee-mode-hook (lambda ()
			      (local-set-key (kbd "C-c C-f") 'coffee-compile-buffer)))
