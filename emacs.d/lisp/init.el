(load "ensure-packages")
;;(require 'ergoemacs-mode)

;;(setq ergoemacs-theme nil)
;;(setq ergoemacs-keyboard-layout "us")
;;(ergoemacs-mode 1)

;;order is important
(load "fonts")
(load "misc")
(load "global")
(load "bindings")

;;go mode has a dependency on auto-complete
(load "go")
(load "web")

;; (load "goflymake/go-flymake")           ;
;; (load "goflymake/go-flycheck")
;; (require 'go-flymake)
;; (require 'go-flycheck)
;;(load "oracle")

;; (load "textmate")
;; (require 'textmate)
;; (textmate-mode)

;; (require 'ecb-autoloads)

;; (load "jedi-mode")
(load "desktop-mode")
;; (load "eclim-mode")
(load "coffee-defaults")

;;; init.el ends here
