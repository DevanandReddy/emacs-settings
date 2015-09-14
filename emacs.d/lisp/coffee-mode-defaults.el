(add-to-list 'load-path "~/.emacs.d/elpa/coffee-mode-0.4.1.1")
(require 'coffee-mode)

;; coffeescript
(custom-set-variables
 '(coffee-tab-width 4)
 '(coffee-args-compile '("-c" "--bare")))

(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)
     (define-key coffee-mode-map (kbd "C-c C-c") 'coffee-compile-buffer)
     (define-key coffee-mode-map (kbd "C-c C-s") 'coffee-compile-region)
     (setq whitespace-action '(auto-cleanup))
     (setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
     ))

(add-to-list 'ac-modes 'coffee-mode)
(global-auto-complete-mode t)
(add-to-list 'auto-mode-alist '("\\.litcoffee\\'" . coffee-mode))
