(defun myTerminal/define-personal-functions ()
  (defun myTerminal/move-line-up ()
    "Move the current line up by one step"
    (interactive)
    (transpose-lines 1)
    (forward-line -2))

  (defun myTerminal/move-line-down ()
    "Move the current line down by one step"
    (interactive)
    (forward-line 1)
    (transpose-lines 1)
    (forward-line -1))

  (defun myTerminal/eval-and-replace ()
    "Replace expression to the left with it's value in the current buffer"
    (interactive)
    (backward-kill-sexp)
    (prin1 (eval (read (current-kill 0)))
           (current-buffer)))

  (defun myTerminal/apply-keyboard-bindings (pair)
    "Apply keyboard-bindings for supplied list of key-pair values"
    (global-set-key (kbd (car pair))
                    (cdr pair)))

  (defun myTerminal/reload-current-file ()
    "Reloads the file loaded in current buffer from the disk"
    (interactive)
    (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                   (message "File reloaded")))
          (t (message "You're not editing a file!"))))

  (define-minor-mode halal-mode
    "Toggle halal-mode"
    :init-value nil
    :lighter " halal"
    :keymap nil))
