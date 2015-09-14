;;load paths
(add-to-list 'load-path "~/.emacs.d/lisp")

(load "init")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-args-compile (quote ("-c" "--bare")))
 '(coffee-tab-width 4)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("bed4d169698488b8b5b90f7dbdbaca2e7b9c4a18727adbb7b3ddcb4df0577ce0" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(display-time-mode t)
 '(ecb-layout-window-sizes
   (quote
    (("left3"
      (ecb-directories-buffer-name 0.3235294117647059 . 0.39622641509433965)
      (ecb-sources-buffer-name 0.3235294117647059 . 0.32075471698113206)
      (ecb-methods-buffer-name 0.3235294117647059 . 0.2641509433962264)))))
 '(ecb-options-version "2.40")
 '(eclim-eclipse-dirs
   (quote
    ("/Users/gdr/Applications/springsource/sts-3.4.0.RELEASE")))
 '(fci-rule-color "#232A2F")
 '(safe-local-variable-values (quote ((project-venv-name . "py3django"))))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B3B40")
 '(vc-annotate-color-map
   (quote
    ((20 . "#74CBC4")
     (40 . "#74CBC4")
     (60 . "#C2E982")
     (80 . "#F9D330")
     (100 . "#FFEB95")
     (120 . "#FFEB95")
     (140 . "#546D7A")
     (160 . "#546D7A")
     (180 . "#9FAA9B")
     (200 . "#9FC59F")
     (220 . "#859900")
     (240 . "#F77669")
     (260 . "#FF516D")
     (280 . "#82B1FF")
     (300 . "#82B1FF")
     (320 . "#82B1FF")
     (340 . "#74CBC4")
     (360 . "#A579C2"))))
 '(vc-annotate-very-old-color "#A579C2"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 117 :width normal)))))
;;(setq debug-on-error t)
(put 'dired-find-alternate-file 'disabled nil)
