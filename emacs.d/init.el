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
;;(load "~/.emacs.d/lisp/go")
(load "~/.emacs.d/lisp/web")
;;(load "oracle")

;; (load "~/.emacs.d/lisp/jedi-mode")
(load "~/.emacs.d/lisp/desktop-mode")
;; (load "eclim-mode")
(load "~/.emacs.d/lisp/coffee-defaults")

;;; init.el ends here
(load "~/.emacs.d/lisp/misc")
;; (load "~/.emacs.d/lisp/elixir-setup")
(load "~/.emacs.d/lisp/registers")
(load "~/.emacs.d/lisp/go-bimenu.el")
(load "~/.emacs.d/lisp/elisp-mode")
(load "~/.emacs.d/lisp/clojure-mode")
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
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("a4df5d4a4c343b2712a8ed16bc1488807cd71b25e3108e648d4a26b02bc990b3" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" default)))
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
    (which-key cider helm-projectile projectile direnv tree-mode smart-mode-line-powerline-theme smart-mode-line yaml-mode window-numbering web-mode web-beautify vlf virtualenvwrapper ujelly-theme tao-theme swiper-helm sublime-themes spaceline smartparens rich-minority react-snippets phoenix-dark-pink-theme ox-gfm nlinum neotree markdown-mode magit mag-menu json-mode js2-mode jedi htmlize helm-itunes helm-ag govet golden-ratio go-snippets go-scratch go-rename go-guru go-errcheck go-eldoc go-direx flymake-python-pyflakes flymake-json flymake-go flycheck-protobuf flycheck firecode-theme fiplr f expand-region exec-path-from-shell emacs-eclim elpy elixir-yasnippets ecb dracula-theme diff-hl color-theme-solarized coffee-mode aurora-theme angular-snippets alchemist ag ack ace-window ace-jump-mode abyss-theme)))
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
