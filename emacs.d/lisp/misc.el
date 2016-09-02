;; By an unknown contributor

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
    (t (self-insert-command (or arg 1)))))

(setq ibuffer-formats
      '((mark modified read-only " "
          (name 30 30 :left :elide) " "
          (size 9 -1 :right) " "
          (mode 16 16 :left :elide) " " filename-and-process)
    (mark " " (name 16 -1) " " filename)))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 30)
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ibuffer-expert t)
(ido-mode t)

;; This is for running in terminal(iterm2, gnome Terminal)

(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)

;; ask the user if they wish to clock out before killing Emacs
(defun my/org-query-clock-out ()
"Ask the user before clocking out.
This is a useful function for adding to `kill-emacs-query-functions'."
(if (and (featurep 'org-clock)
(funcall 'org-clocking-p)
(y-or-n-p "You are currently clocking time, clock out? "))
(org-clock-out)
t)) ; only fails on keyboard quit or error

(add-hook 'kill-emacs-query-functions 'my/org-query-clock-out)

(require 'powerline)
(powerline-default-theme)
(provide 'misc)
;;; misc.el ends here
