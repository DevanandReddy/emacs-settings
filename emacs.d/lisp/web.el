(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'coffee-mode)
(setq web-mode-markup-indent-offset 2)

;;shortcuts
(define-key web-mode-map (kbd "C-m") 'web-mode-fold-or-unfold)
