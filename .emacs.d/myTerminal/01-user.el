(defun myTerminal/user/set-user-preferences ()
  (setq user-full-name
        "Ismail Ansari")

  (setq backup-inhibited
        t)

  (setq auto-save-default
        nil)

  (setq initial-buffer-choice
        t)
  (setq initial-scratch-message
        "Welcome myTerminal!\n\n")

  (prefer-coding-system 'utf-8-unix)

  (setq-default indent-tabs-mode
                nil))
