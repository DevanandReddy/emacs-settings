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
(require 's)

(defcustom gotags-command "gotags"
  "The 'gotags' command"
  :group 'gotags
  :type 'string)
(defcustom gotags-ctypes-color 'DarkOrange
  "The 'gotags' command"
  :group 'gotags
  :type 'string)
(defcustom gotags-signature-color 'green
  "The 'gotags' command"
  :group 'gotags
  :type 'string)
(defcustom gotags-type-color 'cyan
  "The 'gotags' command"
  :group 'gotags
  :type 'string)

(defcustom gotags-test-command "go test -run"
  "The gotags test command"
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
  (let ((record-type (get-value record 'Type)))
    (cond ((or (equal "m" record-type) (equal "o" record-type));;for methods
           (concat
            (if (equal (get-value record 'Fields 'ntype) nil)
                (format "%s" (propertize (get-value record 'Fields 'ctype) 'face '(:foreground "DarkOrange")))" "
                (format "%s" (propertize (get-value record 'Fields 'ntype) 'face '(:foreground "DarkOrange"))))" "
                (format "%s" (propertize (get-value record 'Name)))
                (format "%s" (propertize (get-value record 'Fields 'signature) 'face '(:foreground "green")))" "
                (if (not (equal (get-value record 'Fields 'type) ""))
                    (concat "(" (format "%s" (propertize (get-value record 'Fields 'type) 'face '(:foreground "cyan"))) ")")
                  )))
        ;;;for function
          ((equal "f" record-type)
           (concat
            (format "%s" (propertize (get-value record 'Name) 'face '(:foreground "white")))
            (format "%s" (propertize (get-value record 'Fields 'signature) 'face '(:foreground "green")))" "
            (if (not (equal (get-value record 'Fields 'type) ""))
                (concat "(" (format "%s" (propertize (get-value record 'Fields 'type) 'face '(:foreground "cyan"))) ")")
              )
            ))
          ((equal "w" record-type) ;;for structs
           (concat
            (format "%s" (propertize (get-value record 'Fields 'ctype) 'face '(:foreground "DarkOrange")))" "
            (get-value record 'Name) " "
            (format "%s" (propertize (get-value record 'Fields 'type) 'face '(:foreground "cyan")))" "
            ))
          ((or (equal "t" record-type) (equal "v" record-type)) ;;for types and variables
           (concat
            (get-value record 'Name) " "
            (if (not(equal (get-value record 'Fields 'type) nil))
                (format "%s" (propertize (get-value record 'Fields 'type) 'face '(:foreground "cyan"))))
            )
           )
          ((or (equal "i" record-type) (equal "c" record-type) (equal "n" record-type));;for imports,constants,interfaces
           (get-value record 'Name)
           )
        ;;; Default clause, if none of the matches
          (t (get-value record 'Name))
          )))

(defun gotags--call (path)
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
                  "-format"
                  "json"
                  "-R"
                  path)
    (with-current-buffer outbuf
      (let ((json-object-type 'alist) (json-array-type 'list))
        (json-read-from-string (buffer-string))))
           ))

(defun create-list (gotags-data section)
(let ((clist)(alist) (a1) (a2))
  (setq clist (list))
  (dolist (elem (get-value gotags-data section))
    (push (cons (paramize elem) elem) clist))
  (reverse clist)))

(defun build-action (rec)
  (let (actions (list))
    (push '("Go". (lambda (rec)
                    (gotags--goto-line (get-value rec 'Address)))) list)
    )
  )
(defun create-helm-source (gotags-data section-name )
  (let ((gotags-helm-source) (section-data))
    (setq section-data (create-list gotags-data section-name))
    (setq gotags-helm-source (helm-build-sync-source (symbol-name section-name)
                               :candidates section-data
                               :action '(("Go". (lambda (rec)
                                                  (godef--find-file-line-column (format "%s:%d:1" (get-value rec 'File)  (get-value rec 'Address)) nil)
                                                  ))
                                         ("Test" . (lambda (rec)
                                                     (if (s-suffix? "_test.go" (buffer-file-name))
                                                         (if (equal (get-value rec 'Fields 'signature) "(t *testing.T)")
                                                             (compile (format "%s %s" gotags-test-command  (get-value rec 'Name)))
                                                       (message "%s" (propertize "Not a test" 'face '(:foreground "orange")))
                                                           )
                                                       (message "%s" (propertize "Not a test file" 'face '(:foreground "orange")))
                                                       )))
                                         )
                               :fuzzy-match t
                               ))))

(defun gotags-commands (op)
(let ((gotags-data) (helm-list) (gotags-source-list) (key)
      (keys '(Methods Functions Interfaces Types Fields Variables Constants Imports)))
  (setq gotags-data
        (cond ((equal op "file") (gotags--call (buffer-file-name)))
              ((equal op "package") (gotags--call default-directory))
              ))

    (kill-buffer "*gotags*")
    ;; After many usage trials, I felt Methods,Functions are more frequently looked for than variables, constants, imports
    (font-lock-mode-set-explicitly)
    (while keys
      (setq key (pop keys))
      (push   (create-helm-source  gotags-data key) gotags-source-list)
      )
    (helm  :sources (reverse gotags-source-list))
    ))

(defun gotags-file()
(interactive)
  (gotags-commands "file"))
(defun gotags-package()
(interactive)
  (gotags-commands "package"))

(provide 'go-tags)

;;; go-tags.el ends here
