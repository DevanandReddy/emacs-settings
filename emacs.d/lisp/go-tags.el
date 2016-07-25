;;; go-tags.el --- Code outline for golang
;; Author: gdr
;; Version: 0.1.0
;; Keywords: languages go
;; URL: https://github.com/gdrte
;;
;; This file is not part of GNU Emacs.

;;; Code:
(require 'helm)
(require 'json)
(require 'go-mode)

(defcustom gotags-command "gotags"
  "The 'gotags' command"
  :group 'gotags
  :type 'string)

(defun gotags--call (file-name)
  "Call gotags, parsing the current buffer(file), build a
helm structure"
  (if (not (buffer-file-name (go--coverage-origin-buffer)))
      (error "Cannot use gotags on a buffer without a file name"))
  (let ((outbuf (get-buffer-create "*gotags*"))
        (coding-system-for-read 'utf-8)
        (coding-system-for-write 'utf-8))
    (with-current-buffer outbuf
      (erase-buffer))
    (call-process gotags-command
                  nil
                  outbuf
                  nil
                  "--format"
                  "json-compact"
                  file-name)
    (with-current-buffer outbuf
      (let ((json-object-type 'alist) (json-array-type 'list))
        (json-read-from-string (buffer-string))))
           ))

(defun gotags--goto-line (line)
  (goto-char (point-min))
  (forward-line (1- line)))

(defun create-list (gotags-data section)
(let ((clist))
  (setq clist (list))
  (dolist (elem (cdr(assoc section gotags-data)))
    (push (cons (cdr (assoc 'Field elem)) (cdr (assoc 'Line elem))) clist)
    )
  (reverse clist))
)

(defun create-helm-source (gotags-data section-name src-title)
  (let ((gotags-helm-source) (section-data))
    (setq section-data (create-list gotags-data section-name))
    (setq gotags-helm-source (helm-build-sync-source src-title
                               :candidates section-data
                               :action (lambda (line-no)
                                                (gotags--goto-line line-no))
                               :fuzzy-match t
                               ))))

(defun gotags-helm ()
(interactive)
  (let ((gotags-data) (helm-list) (go-file-name))
    (setq go-file-name (buffer-file-name))
    (setq gotags-data (gotags--call go-file-name))
    ;; After many usage trials, I felt Methods,Functions are more frequently looked for than variables, constants, imports
    (helm  :sources (list
                    (create-helm-source  gotags-data 'Methods "Methods")
                    (create-helm-source  gotags-data 'Functions "Functions")
                    (create-helm-source  gotags-data 'Interfaces "Interfaces")
                    (create-helm-source  gotags-data 'Types "Types")
                    (create-helm-source  gotags-data 'Fields "Fields")
                    (create-helm-source  gotags-data 'Variables "Variables")
                    (create-helm-source  gotags-data 'Constants "Constants")
                    (create-helm-source  gotags-data 'Imports "Imports")
                    ))))

(provide 'go-tags)

;;; go-tags.el ends here
