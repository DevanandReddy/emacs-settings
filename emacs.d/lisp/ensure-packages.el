(require 'package)
(add-to-list 'package-archives
     '("melpa-stable" . "http://melpa.org/packages/") t)
(package-initialize)

;;; Code;This file checks for the installed packages and installs if any missing
(setq package-list
      '(
        doom-modeline
        gruvbox-theme
        cider
        flycheck-clojure
        clj-refactor
        projectile
        helm-projectile
        ace-window
        rainbow-delimiters
        flycheck-pos-tip
        ace-jump-mode
        async
        auto-complete
        avy
        company
        concurrent
        ctable
        dash
        deferred
        diff-hl
        direx
        expand-region
        epc
        epl
        exec-path-from-shell
        fiplr
        flycheck
        flymake-go
        flymake-json
        flymake-python-pyflakes
        git-commit
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
        helm-ag
        htmlize
        company-jedi
        json-mode
        json-reformat
        json-snatcher
        let-alist
        magit
        magit-popup
        pkg-info
        popup
        mood-line
        protobuf-mode
        python-environment
        smartparens
        seq
        virtualenvwrapper
        web-beautify
        web-mode
        window-numbering
        with-editor
        yaml-mode
        alchemist
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
       ;;(if (y-or-n-p (format "Package %s is missing. Install it? " package))
       (package-install package) package))
   packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))
;; Do not run this every time you start. Run this for a new setup
(ensure-package-installed  package-list)

(provide 'ensure-packages)
