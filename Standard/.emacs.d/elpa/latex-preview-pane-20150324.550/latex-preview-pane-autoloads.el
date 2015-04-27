;;; latex-preview-pane-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "latex-preview-pane" "latex-preview-pane.el"
;;;;;;  (21822 13250 543548 490000))
;;; Generated autoloads from latex-preview-pane.el

(autoload 'latex-preview-pane-enable "latex-preview-pane" "\
Enable `latex-preview-pane-mode' in `latex-mode'.

\(fn)" nil nil)

(autoload 'init-latex-preview-pane "latex-preview-pane" "\


\(fn)" nil nil)

(autoload 'latex-preview-update "latex-preview-pane" "\


\(fn)" t nil)

(autoload 'latex-preview-pane-update "latex-preview-pane" "\


\(fn)" t nil)

(autoload 'latex-preview-pane-update-p "latex-preview-pane" "\


\(fn)" nil nil)

(autoload 'latex-preview-pane-mode "latex-preview-pane" "\
Toggle Latex Preview Pane Mode.
     Interactively with no argument, this command toggles the mode.
     A positive prefix argument enables the mode, any other prefix
     argument disables it.  From Lisp, argument omitted or nil enables
     the mode, `toggle' toggles the state.
     
     When Latex Preview Pane mode is enabled, saving a latex file will cause 
     a PDF preview pane of your document to appear.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("latex-preview-pane-pkg.el") (21822 13250
;;;;;;  693057 292000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; latex-preview-pane-autoloads.el ends here
