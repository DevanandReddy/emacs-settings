;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/lisp/ensure-packages")
;;order is important
(load "~/.emacs.d/lisp/fonts")
(load "~/.emacs.d/lisp/global")
(load "~/.emacs.d/lisp/bindings")

;;go mode has a dependency on auto-complete
(load "~/.emacs.d/lisp/go")
(load "~/.emacs.d/lisp/web")
;;(load "oracle")

(load "~/.emacs.d/lisp/jedi-mode")
(load "~/.emacs.d/lisp/desktop-mode")
;; (load "eclim-mode")
(load "~/.emacs.d/lisp/coffee-defaults")

;;; init.el ends here
(load "~/.emacs.d/lisp/misc")
(load "~/.emacs.d/lisp/elixir-setup")
(load "~/.emacs.d/lisp/registers")
(load "~/.emacs.d/lisp/go-tags")
(load "~/.emacs.d/lisp/elisp-mode")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(ansi-term-color-vector
   [unspecified "#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"] t)
 '(blink-cursor-mode nil)
 '(coffee-args-compile (quote ("-c" "--bare")))
 '(coffee-tab-width 4)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tronesque)))
 '(custom-safe-themes
   (quote
    ("cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" "427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "345f8f92edc3508574c61850b98a2e0a7a3f5ba3bb9ed03a50f6e41546fe2de0" "ba6f8606cae826654d4c2242363f2042dd35c1595ef6367ad44d5f42851e6aa9" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "d1abda58eedee72fbe28bbb7a5ff1953e1b7d2fa80913bcea9cb3cf12cf751f4" "222113f148cd70d99c44d84bf4e3a76795f001bd6cfd449b7ff27aeda65ffd78" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "e431a5e1c1c8621df9be2c7a8cc412b26a04f58d7da913f81e1480493fbc42c7" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "fbcdb6b7890d0ec1708fa21ab08eb0cc16a8b7611bb6517b722eba3891dfc9dd" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "790e74b900c074ac8f64fa0b610ad05bcfece9be44e8f5340d2d94c1e47538de" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "f9574c9ede3f64d57b3aa9b9cef621d54e2e503f4d75d8613cbcc4ca1c962c21" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "b7ba8bd70d2c954e326144c5bf11eecffd55683dfa76aa16bc53572a6184bc1d" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "bed4d169698488b8b5b90f7dbdbaca2e7b9c4a18727adbb7b3ddcb4df0577ce0" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(display-time-mode t)
 '(ecb-layout-window-sizes
   (quote
    (("left3"
      (ecb-directories-buffer-name 0.3235294117647059 . 0.39622641509433965)
      (ecb-sources-buffer-name 0.3235294117647059 . 0.32075471698113206)
      (ecb-methods-buffer-name 0.3235294117647059 . 0.2641509433962264)))))
 '(ecb-options-version "2.40")
 '(fci-rule-color "#232A2F")
 '(indent-tabs-mode nil)
 '(initial-scratch-message
   ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

")
 '(linum-format " %7i ")
 '(neo-smart-open nil)
 '(neo-theme (quote nerd))
 '(package-selected-packages
   (quote
    (helm-projectile projectile direnv tronesque-theme tree-mode smart-mode-line-powerline-theme smart-mode-line yaml-mode window-numbering web-mode web-beautify vlf virtualenvwrapper ujelly-theme tao-theme swiper-helm sublime-themes spaceline smartparens rich-minority react-snippets phoenix-dark-pink-theme ox-gfm nlinum neotree markdown-mode magit mag-menu json-mode js2-mode jedi htmlize helm-itunes helm-ag govet golden-ratio go-snippets go-scratch go-rename go-guru go-errcheck go-eldoc go-direx go-autocomplete flymake-python-pyflakes flymake-json flymake-go flycheck-protobuf flycheck firecode-theme fiplr f expand-region exec-path-from-shell emacs-eclim elpy elixir-yasnippets ecb dracula-theme diff-hl color-theme-solarized coffee-mode aurora-theme angular-snippets alchemist ag ack ace-window ace-jump-mode abyss-theme)))
 '(powerline-default-separator (quote wave))
 '(powerline-default-separator-dir (quote (left . right)))
 '(powerline-gui-use-vcs-glyph nil)
 '(recentf-menu-before "Open File...")
 '(scroll-error-top-bottom nil)
 '(set-mark-command-repeat-pop nil)
 '(shift-select-mode t)
 '(show-paren-mode t)
 '(sml/mode-width
   (if
       (eq
        (powerline-current-separator)
        (quote arrow))
       (quote right)
     (quote full)))
 '(sml/pos-id-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (car powerline-default-separator-dir)))
                   (quote powerline-active1)
                   (quote powerline-active2))))
     (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (cdr powerline-default-separator-dir)))
                   (quote powerline-active1)
                   (quote sml/global))))
     (:propertize " " face sml/global))))
 '(sml/pre-id-separator
   (quote
    (""
     (:propertize " " face sml/global)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (car powerline-default-separator-dir)))
                   (quote sml/global)
                   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (cdr powerline-default-separator-dir)))
                   (quote powerline-active2)
                   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes)))
 '(tab-width 4)
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
;;(setq debug-on-error t)
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(powerline-active1 ((t (:inherit mode-line :background "Red" :foreground "yellow1"))))
 '(powerline-active2 ((t (:inherit mode-line :background "Yellow" :foreground "dark blue"))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "gray66" :foreground "Black")))))
