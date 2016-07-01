(load "ensure-packages")
;;(require 'ergoemacs-mode)

;;(setq ergoemacs-theme nil)
;;(setq ergoemacs-keyboard-layout "us")
;;(ergoemacs-mode 1)

;;order is important
(load "fonts")
(load "global")
(load "bindings")

;;go mode has a dependency on auto-complete
(load "go")
(load "web")
;;(load "oracle")

(load "jedi-mode")
(load "desktop-mode")
;; (load "eclim-mode")
(load "coffee-defaults")

;;; init.el ends here
(load "misc")
