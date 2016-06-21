;; key bindings
(setq mac-command-modifier (quote control))
(setq mac-control-modifier (quote super))
(menu-bar-mode -1)
;; Don't show the startup screen
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)
(pending-delete-mode t)

(global-linum-mode 1)
(setq linum-format "%3d ")
;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)

;; Modeline info
(display-time-mode 1)
;; (display-battery-mode 1)

;; Small fringes
;;(set-fringe-mode '(1 . 1))

;; Emacs gurus don't need no stinking scroll bars
(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1))

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;; Line-wrapping
(set-default 'fill-column 78)

;; Prevent the annoying beep on errors
(setq ring-bell-function 'ignore)


;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Gotta see matching arens
(show-paren-mode t)

;; Don't truncate lines
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; For emacsclient
;;(server-start)

;; Trailing whitespace is unnecessary
(defvar whitespace-cleanup-on-save t)
;; (setq whitespace-cleanup-on-save nil)
(add-hook 'before-save-hook
	  (lambda ()
	    (if whitespace-cleanup-on-save (whitespace-cleanup))))

;; Trash can support
(setq delete-by-moving-to-trash t)

;; `brew install aspell --lang=en` (instead of ispell)
(setq-default ispell-program-name "aspell")
(setq ispell-list-command "list")
(setq ispell-extra-args '("--sug-mode=ultra"))

;; zap-up-to-char, forward-to-word, backward-to-word, etc
;;(require 'misc)

(tool-bar-mode -1)

(exec-path-from-shell-initialize)


(defadvice compile (around split-horizontally activate)
  (let ((split-width-threshold nil)
	(split-height-threshold 0))
    ad-do-it))
;; "^\*Mess"
(setq
  ido-ignore-buffers ;; ignore these guys
  '("\\` "  "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
     "^\*compilation" "^\*GTAGS" "^session\.*");; "^\*")

  ido-case-fold  t                 ; be case-insensitive

  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
)

(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

(require 'tramp)
(setq tramp-default-method "ssh")

(setq frame-title-format '(:eval (if (buffer-file-name) (abbreviate-file-name (buffer-file-name)) "%b")))

(setq org-src-fontify-natively t)

(setq tab-width 4)
(setq-default indent-tabs-mode nil)

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
	(message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
	(cond
	 ((vc-backend filename) (vc-rename-file filename new-name))
	 (t
	  (rename-file filename new-name t)
	  (set-visited-file-name new-name t t)))))))
(global-set-key (kbd "C-c C-r")  'rename-file-and-buffer)
(setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules" "vendor" "pkg" "bin"))
			    (files ("*.jpg" "*.png" "*.zip" "*~"))))
