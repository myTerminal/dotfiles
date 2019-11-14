(defun mt/print-welcome-message ()
  "Prints a welcome message with date and startup time"
  (princ (concat "Welcome myTerminal!"
                 "\n\n"
                 "Today's "
                 (format-time-string "%B %d %Y")
                 ", let's make it a productive day!"
                 "\n\n"
                 "(Started in "
                 (number-to-string (cadr (time-subtract (current-time)
                                                        mt/invokation-time)))
                 " seconds)")
         (get-buffer-create (current-buffer))))

(defun mt/assign-function-to-keys (pair)
  "Applies keyboard-bindings for supplied list of key-pair values"
  (global-set-key (kbd (car pair))
                  (cdr pair)))

(defun mt/set-zoning ()
  "Sets zoning timeout"
  (interactive)
  (zone-when-idle 60)
  (message "Zoning set"))

(defun mt/change-line-endings-to-unix ()
  "Changes line-endings of current file to utf-8-unix."
  (interactive)
  (set-buffer-file-coding-system
    'utf-8-unix))

(defun mt/move-line-up ()
  "Moves the current line up by one step."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun mt/move-line-down ()
  "Moves the current line down by one step."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(defun mt/delete-word-backward ()
  "Deletes the word on the left of the cursor."
  (interactive)
  (set-mark-command nil)
  (backward-word)
  (backward-delete-char-untabify 1))

(defun mt/eval-and-replace ()
  "Replaces expression to the left with it's value in the current buffer."
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
         (current-buffer)))

(defun mt/reload-current-file ()
  "Reloads the file loaded in current buffer from the disk."
  (interactive)
  (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                 (message "File reloaded")))
        (t (message "You're not editing a file!"))))

(defun mt/remove-formatting (text)
  "Removes formatting of the supplied text."
  (interactive "sEnter text: ")
  (kill-new text)
  (message "Formatting removed, text copied to clipboard!"))

(defun mt/load-personalization-variables ()
  "Loads personalization for current system"
  (theme-looper-enable-theme mt/workstation-variables/color-theme)
  (add-to-list 'default-frame-alist
               `(font . ,mt/workstation-variables/font-default))
  (add-hook 'prog-mode-hook
            (lambda ()
              (setq buffer-face-mode-face `(:family ,mt/workstation-variables/font-family-for-programming))
              (buffer-face-mode)))
  (set-frame-size (selected-frame)
                  (car mt/workstation-variables/frame-dimensions)
                  (cdr mt/workstation-variables/frame-dimensions)))
