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
