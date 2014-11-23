;;; e2wm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (e2wm:start-management) "e2wm" "e2wm.el" (21617
;;;;;;  51807 811886 491000))
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

;;;### (autoloads (e2wm:dp-svn e2wm:dp-monky e2wm:dp-magit) "e2wm-vcs"
;;;;;;  "e2wm-vcs.el" (21617 51807 719909 656000))
;;; Generated autoloads from e2wm-vcs.el

(autoload 'e2wm:dp-magit "e2wm-vcs" "\


\(fn)" t nil)

(autoload 'e2wm:dp-monky "e2wm-vcs" "\


\(fn)" t nil)

(autoload 'e2wm:dp-svn "e2wm-vcs" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("e2wm-pkg.el") (21617 51807 872209 64000))

;;;***

(provide 'e2wm-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; e2wm-autoloads.el ends here
