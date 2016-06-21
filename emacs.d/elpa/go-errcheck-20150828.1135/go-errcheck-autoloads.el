;;; go-errcheck-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "go-errcheck" "../../../../../.emacs.d/elpa/go-errcheck-20150828.1135/go-errcheck.el"
;;;;;;  "f142401ea891fc99e60e17f83b10fc24")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/go-errcheck-20150828.1135/go-errcheck.el

(autoload 'go-errcheck "go-errcheck" "\
Run errcheck on the current buffer's directory and display the
  output in a compilation buffer.

If ARG is non-nil, go-errcheck will query for the values of
IGNOREPKG and IGNORE which will override any defaults or file
local variables.

When called non-interactively, DIRECTORY, IGNOREPKG and IGNORE
can be specified as arguments. If DIRECTORY is nil, it will
default to the buffer's directory.

\(fn DIRECTORY IGNOREPKG IGNORE)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/go-errcheck-20150828.1135/go-errcheck-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/go-errcheck-20150828.1135/go-errcheck.el")
;;;;;;  (22377 44565 484784 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; go-errcheck-autoloads.el ends here
