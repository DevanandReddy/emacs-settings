(require 'eclim)

(global-eclim-mode)
(custom-set-variables '(eclim-eclipse-dirs '("/Users/gdr/Applications/springsource/sts-3.4.0.RELEASE")))
(setq eclim-executable "/Users/gdr/Applications/springsource/sts-3.4.0.RELEASE/eclim")

(setq eclim-auto-save nil)


(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(define-key eclim-mode-map (kbd "C-c C-j") 'eclim-java-find-declaration)
(define-key eclim-mode-map (kbd "C-c C-f") 'eclim-file-locate)
(define-key eclim-mode-map (kbd "C-c C-e x") 'eclim-problems-correct)
(defun save-show ()
  "Save the current buffer and show the context sensitive help"
  (interactive)
  (save-buffer)
  (ac-complete-emacs-eclim))
(define-key eclim-mode-map (kbd "C-c C-e l") 'save-show)
