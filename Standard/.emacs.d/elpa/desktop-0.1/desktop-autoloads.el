;;; desktop-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (desktop-revert desktop-save-in-desktop-dir desktop-change-dir
;;;;;;  desktop-load-default desktop-read desktop-remove desktop-save
;;;;;;  desktop-clear desktop-locals-to-save desktop-save-mode) "desktop"
;;;;;;  "desktop.el" (21294 54980 708801 779000))
;;; Generated autoloads from desktop.el

(defvar desktop-save-mode nil "\
Non-nil if Desktop-Save mode is enabled.
See the command `desktop-save-mode' for a description of this minor mode.")

(custom-autoload 'desktop-save-mode "desktop" nil)

(autoload 'desktop-save-mode "desktop" "\
Toggle desktop saving mode.
With numeric ARG, turn desktop saving on if ARG is positive, off
otherwise.  If desktop saving is turned on, the state of Emacs is
saved from one session to another.  See variable `desktop-save'
and function `desktop-read' for details.

\(fn &optional ARG)" t nil)

(defvar desktop-locals-to-save '(desktop-locals-to-save truncate-lines case-fold-search case-replace fill-column overwrite-mode change-log-default-name line-number-mode column-number-mode size-indication-mode buffer-file-coding-system indent-tabs-mode tab-width indicate-buffer-boundaries indicate-empty-lines show-trailing-whitespace) "\
List of local variables to save for each buffer.
The variables are saved only when they really are local.  Conventional minor
modes are restored automatically; they should not be listed here.")

(custom-autoload 'desktop-locals-to-save "desktop" t)

(defvar desktop-save-buffer nil "\
When non-nil, save buffer status in desktop file.
This variable becomes buffer local when set.

If the value is a function, it is called by `desktop-save' with argument
DESKTOP-DIRNAME to obtain auxiliary information to save in the desktop
file along with the state of the buffer for which it was called.

When file names are returned, they should be formatted using the call
\"(desktop-file-name FILE-NAME DESKTOP-DIRNAME)\".

Later, when `desktop-read' evaluates the desktop file, auxiliary information
is passed as the argument DESKTOP-BUFFER-MISC to functions in
`desktop-buffer-mode-handlers'.")

(defvar desktop-buffer-mode-handlers nil "\
Alist of major mode specific functions to restore a desktop buffer.
Functions listed are called by `desktop-create-buffer' when `desktop-read'
evaluates the desktop file.  List elements must have the form

   (MAJOR-MODE . RESTORE-BUFFER-FUNCTION).

Buffers with a major mode not specified here, are restored by the default
handler `desktop-restore-file-buffer'.

Handlers are called with argument list

   (DESKTOP-BUFFER-FILE-NAME DESKTOP-BUFFER-NAME DESKTOP-BUFFER-MISC)

Furthermore, they may use the following variables:

   desktop-file-version
   desktop-buffer-major-mode
   desktop-buffer-minor-modes
   desktop-buffer-point
   desktop-buffer-mark
   desktop-buffer-read-only
   desktop-buffer-locals

If a handler returns a buffer, then the saved mode settings
and variable values for that buffer are copied into it.

Modules that define a major mode that needs a special handler should contain
code like

   (defun foo-restore-desktop-buffer
   ...
   (add-to-list 'desktop-buffer-mode-handlers
                '(foo-mode . foo-restore-desktop-buffer))

Furthermore the major mode function must be autoloaded.")

(put 'desktop-buffer-mode-handlers 'risky-local-variable t)

(defvar desktop-minor-mode-handlers nil "\
Alist of functions to restore non-standard minor modes.
Functions are called by `desktop-create-buffer' to restore minor modes.
List elements must have the form

   (MINOR-MODE . RESTORE-FUNCTION).

Minor modes not specified here, are restored by the standard minor mode
function.

Handlers are called with argument list

   (DESKTOP-BUFFER-LOCALS)

Furthermore, they may use the following variables:

   desktop-file-version
   desktop-buffer-file-name
   desktop-buffer-name
   desktop-buffer-major-mode
   desktop-buffer-minor-modes
   desktop-buffer-point
   desktop-buffer-mark
   desktop-buffer-read-only
   desktop-buffer-misc

When a handler is called, the buffer has been created and the major mode has
been set, but local variables listed in desktop-buffer-locals has not yet been
created and set.

Modules that define a minor mode that needs a special handler should contain
code like

   (defun foo-desktop-restore
   ...
   (add-to-list 'desktop-minor-mode-handlers
                '(foo-mode . foo-desktop-restore))

Furthermore the minor mode function must be autoloaded.

See also `desktop-minor-mode-table'.")

(put 'desktop-minor-mode-handlers 'risky-local-variable t)

(autoload 'desktop-clear "desktop" "\
Empty the Desktop.
This kills all buffers except for internal ones and those with names matched by
a regular expression in the list `desktop-clear-preserve-buffers'.
Furthermore, it clears the variables listed in `desktop-globals-to-clear'.

\(fn)" t nil)

(autoload 'desktop-save "desktop" "\
Save the desktop in a desktop file.
Parameter DIRNAME specifies where to save the desktop file.
Optional parameter RELEASE says whether we're done with this desktop.
See also `desktop-base-file-name'.

\(fn DIRNAME &optional RELEASE)" t nil)

(autoload 'desktop-remove "desktop" "\
Delete desktop file in `desktop-dirname'.
This function also sets `desktop-dirname' to nil.

\(fn)" t nil)

(autoload 'desktop-read "desktop" "\
Read and process the desktop file in directory DIRNAME.
Look for a desktop file in DIRNAME, or if DIRNAME is omitted, look in
directories listed in `desktop-path'.  If a desktop file is found, it
is processed and `desktop-after-read-hook' is run.  If no desktop file
is found, clear the desktop and run `desktop-no-desktop-file-hook'.
This function is a no-op when Emacs is running in batch mode.
It returns t if a desktop file was loaded, nil otherwise.

\(fn &optional DIRNAME)" t nil)

(autoload 'desktop-load-default "desktop" "\
Load the `default' start-up library manually.
Also inhibit further loading of it.

\(fn)" nil nil)

(autoload 'desktop-change-dir "desktop" "\
Change to desktop saved in DIRNAME.
Kill the desktop as specified by variables `desktop-save-mode' and
`desktop-save', then clear the desktop and load the desktop file in
directory DIRNAME.

\(fn DIRNAME)" t nil)

(autoload 'desktop-save-in-desktop-dir "desktop" "\
Save the desktop in directory `desktop-dirname'.

\(fn)" t nil)

(autoload 'desktop-revert "desktop" "\
Revert to the last loaded desktop.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("desktop-pkg.el") (21294 54980 803556
;;;;;;  988000))

;;;***

(provide 'desktop-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; desktop-autoloads.el ends here
