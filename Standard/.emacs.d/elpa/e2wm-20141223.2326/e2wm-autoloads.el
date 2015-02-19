;;; e2wm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "e2wm" "e2wm.el" (21734 5222 729285 538000))
;;; Generated autoloads from e2wm.el

(autoload 'e2wm:start-management "e2wm" "\
Setup e2wm window management for the current frame.

To force restart use the universal prefix argument (C-u) or
specify non-nil for FORCE-RESTART when calling as a lisp function.

When the perspective change function `e2wm:pst-change' is called
before executing this initialization function, this function
would be called at `e2wm:pst-change'. Then, NOT-PST-CHANGE is not
`nil' in order to prevent infinite looping.

\(fn &optional PSTSET FORCE-RESTART NOT-PST-CHANGE)" t nil)

;;;***

;;;### (autoloads nil "e2wm-vcs" "e2wm-vcs.el" (21734 5222 638286
;;;;;;  823000))
;;; Generated autoloads from e2wm-vcs.el

(autoload 'e2wm:dp-magit "e2wm-vcs" "\


\(fn)" t nil)

(autoload 'e2wm:dp-monky "e2wm-vcs" "\


\(fn)" t nil)

(autoload 'e2wm:dp-svn "e2wm-vcs" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("e2wm-pkg.el") (21734 5222 806208 29000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; e2wm-autoloads.el ends here
