(defun myTerminal/start-basic-mode ()
  (myTerminal/set-user-preferences)
  (myTerminal/set-up-repositories)
  (myTerminal/set-up-package-lists)
  (myTerminal/load-local-packages)
  (myTerminal/configure-basic-mode-packages)
  (myTerminal/set-file-associations)
  (myTerminal/configure-interface)
  (myTerminal/define-personal-functions)
  (myTerminal/define-basic-mode-keyboard-bindings))

(defun myTerminal/print-welcome-message ()
  (princ (cl-concatenate 'string
                         "Started up in "
                         (number-to-string (cadr (time-subtract (current-time)
                                                                myTerminal/invokation-time)))
                         " seconds\n\n"
                         "Welcome myTerminal!\n\n"
                         "Today's "
                         (format-time-string "%d %B %Y")
                         " and it looks like a productive day, so make it count!")
         (get-buffer-create (current-buffer))))

(defun myTerminal/prompt-for-full-mode ()
  (interactive)
  (if (y-or-n-p "Not running in full-mode. Do you want to progress to full-mode?")
      (myTerminal/progress-to-full-mode)))

(defun myTerminal/progress-to-full-mode ()
  (interactive)
  (message "Progressing to full-mode...")
  (myTerminal/configure-full-mode-packages)
  (myTerminal/configure-jabber)
  (myTerminal/define-full-mode-keyboard-bindings)
  (message "Progressed to full-mode"))

;Start in basic-mode
(myTerminal/start-basic-mode)
(myTerminal/print-welcome-message)

;Load local configuration
(theme-looper-enable-theme myTerminal/local-configs/color-theme)
(custom-set-faces
 `(default ((t (:height ,myTerminal/local-configs/font-height)))))
(set-frame-size (selected-frame)
                (car myTerminal/local-configs/frame-dimensions)
                (cdr myTerminal/local-configs/frame-dimensions))
(mapc 'find-file
      myTerminal/local-configs/startup-files)
