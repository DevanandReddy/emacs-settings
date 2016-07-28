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
(require 'dash)

(defcustom gotags-command "gotags"
  "The 'gotags' command"
  :group 'gotags
  :type 'string)

(defun get-value (alist &rest keys)
  "Recursively find KEYs in ALIST."
  (let ((found t)(key))
    (while (and found keys)
      (setq key (pop keys))
      (cond ((equal (assoc key alist) nil) (setq found nil))
            (t (setq alist (rest (assoc key alist)) found t)
               )
            ))
    (if found
        alist
      nil)))

(defun paramize (record)
  (cond ((or (equal "m" (get-value record 'Type)) (equal "o" (get-value record 'Type)))
         (concat
          (if (equal (get-value record 'Fields 'ntype) nil)
              (format "%s" (propertize (get-value record 'Fields 'ctype) 'face '(:foreground "orange")))" "
              (format "%s" (propertize (get-value record 'Fields 'ntype) 'face '(:foreground "orange"))))" "
              (format "%s" (propertize (get-value record 'Name)))
              (format "%s" (propertize (get-value record 'Fields 'signature) 'face '(:foreground "green")))" "
           (if (not (equal (get-value record 'Fields 'type) ""))
               (concat "(" (format "%s" (propertize (get-value record 'Fields 'type) 'face '(:foreground "cyan"))) ")")
               )
           ))
        ((equal "f" (get-value record 'Type))
         (concat
          (format "%s" (propertize (get-value record 'Name) 'face '(:foreground "white")))
          (format "%s" (propertize (get-value record 'Fields 'signature) 'face '(:foreground "green")))" "
           (if (not (equal (get-value record 'Fields 'type) ""))
               (concat "(" (format "%s" (propertize (get-value record 'Fields 'type) 'face '(:foreground "cyan"))) ")")
               )
           ))
        ((equal "w" (get-value record 'Type))
         (concat
          (format "%s" (propertize (get-value record 'Fields 'ctype) 'face '(:foreground "orange")))" "
          (get-value record 'Name) " "
          (format "%s" (propertize (get-value record 'Fields 'type) 'face '(:foreground "cyan")))" "
          ))
        ((or (equal "t" (get-value record 'Type)) (equal "v" (get-value record 'Type)))
         (concat
          (get-value record 'Name) " "
          (if (not(equal (get-value record 'Fields 'type) nil))
              (format "%s" (propertize (get-value record 'Fields 'type) 'face '(:foreground "cyan"))))
          )
         )
        ((or (equal "i" (get-value record 'Type)) (equal "c" (get-value record 'Type)) (equal "n" (get-value record 'Type)))
          (get-value record 'Name)
         )

        (t (get-value record 'Name))
        ))

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
                  "json"
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
  (dolist (elem (get-value gotags-data section))
    (push (cons (paramize elem) (get-value elem 'Address)) clist))
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
    (kill-buffer "*gotags*")
    ;; After many usage trials, I felt Methods,Functions are more frequently looked for than variables, constants, imports
    (font-lock-mode-set-explicitly)
    (helm  :sources (list
                    (create-helm-source  gotags-data 'Methods "Methods")
                    (create-helm-source  gotags-data 'Functions "Functions")
                    (create-helm-source  gotags-data 'Interfaces "Interfaces")
                    (create-helm-source  gotags-data 'Types "Types")
                    (create-helm-source  gotags-data 'Fields "Fields")
                    (create-helm-source  gotags-data 'Variables "Variables")
                    (create-helm-source  gotags-data 'Constants "Constants")
                    (create-helm-source  gotags-data 'Imports "Imports")
                    ))
    ))

(provide 'go-tags)

;;; go-tags.el ends here
