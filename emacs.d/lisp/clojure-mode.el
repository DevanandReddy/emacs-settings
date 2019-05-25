(require 'company)
(require 'cider)
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


(defun integrant-reset-all ()
  (interactive)
  (cider-interactive-eval
    (format "(require '[integrant.repl :as repl])
             (repl/reset-all)")))

(define-key cider-mode-map (kbd "C-c C-n a") 'integrant-reset-all)

(defun integrant-reset ()
  (interactive)
  (cider-interactive-eval
    (format "(require '[integrant.repl :as repl])
             (repl/reset)")))

(define-key cider-mode-map (kbd "C-c C-n r") 'integrant-reset)

(defun integrant-go ()
  (interactive)
  (cider-interactive-eval
    (format "(require '[integrant.repl :as repl])
             (repl/go)")))
(define-key cider-mode-map (kbd "C-c C-n g") 'integrant-go)

(defun integrant-halt ()
  (interactive)
  (cider-interactive-eval
    (format "(require '[integrant.repl :as repl])
             (repl/halt)")))

(define-key cider-mode-map (kbd "C-c C-n h") 'integrant-halt)

(defun rebl-ui ()
  (interactive)
  (cider-interactive-eval
    (format "(require '[cognitect.rebl :as rebl])
             (rebl/ui)")))

(define-key cider-mode-map (kbd "C-c C-n u") 'rebl-ui)
