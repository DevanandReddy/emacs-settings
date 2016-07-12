(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;; Code;This file checks for the installed packages and installs if any missing
(setq package-list
      '(
        abyss-theme
        ace-window
        async
        aurora-theme
        auto-complete
        avy
        coffee-mode
        color-theme
        color-theme-solarized
        company
        concurrent
        ctable
        dash
        deferred
        diff-hl
        direx
        dracula-theme
        emacs-eclim
        epc
        epl
        exec-path-from-shell
        fiplr
        firecode-theme
        flycheck
        flycheck-protobuf
        flymake-easy
        flymake-go
        flymake-json
        flymake-python-pyflakes
        git-commit
        go-autocomplete
        go-direx
        go-eldoc
        go-errcheck
        go-guru
        go-mode
        go-rename
        go-scratch
        golden-ratio
        grizzl
        helm
        helm-core
        htmlize
        jedi
        json-mode
        json-reformat
        json-snatcher
        let-alist
        magit
        magit-popup
        neotree
        nlinum
        pkg-info
        popup
        powerline
        protobuf-mode
        python-environment
        seq
        sublime-themes
        tao-theme
        ujelly-theme
        virtualenvwrapper
        web-beautify
        web-mode
        window-numbering
        with-editor
        yaml-mode
        yasnippet
        ))


(defun ensure-package-installed (packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     ;; (package-installed-p 'evil)
     (if (package-installed-p package)
     nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
       (package-install package) package)))
   packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))
;; Do not run this every time you start. Run this for a new setup
;;(ensure-package-installed  package-list)
