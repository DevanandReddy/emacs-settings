(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:setup-keys t)
(setq jedi:tooltip-method nil)
(autoload 'jedi:setup "jedi" nil t)
(setq jedi:environment-root "py3.3")  ; or any other name you like
(setq jedi:environment-virtualenv
      (append python-environment-virtualenv
	      '("--python" "/Users/gdr/Projects/python_projects/PyEnvs/py3django/bin/python3")))
;; (setq jedi:environment-virtualenv
      ;; (list "virtualenv3" "--system-site-packages"))

(defun project-directory (buffer-name)
  "Returns the root directory of the project that contains the
given buffer. Any directory with a .git or .jedi file/directory
is considered to be a project root."
  (interactive)
  (let ((root-dir (file-name-directory buffer-name)))
    (while (and root-dir
		(not (file-exists-p (concat root-dir ".git")))
		(not (file-exists-p (concat root-dir ".jedi"))))
      (setq root-dir
	    (if (equal root-dir "/")
		nil
	      (file-name-directory (directory-file-name root-dir)))))
    root-dir))

(defun project-name (buffer-name)
  "Returns the name of the project that contains the given buffer."
  (let ((root-dir (project-directory buffer-name)))
    (if root-dir
	(file-name-nondirectory
	 (directory-file-name root-dir))
      nil)))

(defun jedi-setup-venv ()
  "Activates the virtualenv of the current buffer."
  (let ((project-name (project-name buffer-file-name)))
    (when project-name (venv-workon project-name))))



(add-hook 'python-mode-hook 'jedi-setup-venv)
(add-hook 'python-mode-hook (lambda ()
			      (hack-local-variables)
			      (venv-workon project-venv-name)))
(add-hook 'python-mode-hook 'jedi:setup)




;;virtualenv-wrapper setup

(defvar jedi:goto-stack '())
(defun jedi:jump-to-definition ()
  (interactive)
  (add-to-list 'jedi:goto-stack
	       (list (buffer-name) (point)))
  (jedi:goto-definition))
(defun jedi:jump-back ()
  (interactive)
  (let ((p (pop jedi:goto-stack)))
    (if p (progn
	    (switch-to-buffer (nth 0 p))
	    (goto-char (nth 1 p))))))

;; don't use default keybindings from jedi.el; keep C-. free
;; redefine jedi's C-. (jedi:goto-definition)
;; to remember position, and set C-, to jump back
(add-hook 'python-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-c C-j") 'jedi:jump-to-definition)
	     (local-set-key (kbd "C-c C-,") 'jedi:jump-back)
	     (local-set-key (kbd "C-c d") 'jedi:show-doc)
	     (local-set-key (kbd "C-.") 'jedi:complete)))

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "/Users/gdr/Projects/python_projects/PyEnvs")
