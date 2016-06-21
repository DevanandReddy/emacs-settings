(load 'ensure-packages)
 (require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 30)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)
;;(require 'ergoemacs-mode)

;;(setq ergoemacs-theme nil)
;;(setq ergoemacs-keyboard-layout "us")
;;(ergoemacs-mode 1)

;;order is important
(load "misc")
(load "global")
(load "fonts")
(load "bindings")

;;go mode has a dependency on auto-complete
(load "go")
(load "web")

;; (load "goflymake/go-flymake")           ;
;; (load "goflymake/go-flycheck")
;; (require 'go-flymake)
;; (require 'go-flycheck)
(load "oracle")

;; (load "textmate")
;; (require 'textmate)
;; (textmate-mode)

;; (require 'ecb-autoloads)

;; (load "jedi-mode")
(load "desktop-mode")
;; (load "eclim-mode")
(load "coffee-defaults")

(add-hook 'after-init-hook #'global-flycheck-mode)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(powerline-default-theme)
