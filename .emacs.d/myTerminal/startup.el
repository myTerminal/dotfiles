(defun myTerminal/prompt-for-full-mode ()
  (interactive)
  (if (y-or-n-p "Not running in full-mode. Do you want to progress to full-mode?")
      (myTerminal/progress-to-full-mode)))

(defun myTerminal/progress-to-full-mode ()
  (interactive)
  (myTerminal/configure-full-mode-packages)
  (myTerminal/configure-jabber)
  (message "Progressed to full-mode"))

(myTerminal/set-user-preferences)
(myTerminal/set-up-repositories)
(if (y-or-n-p "Install pending packages?")
    (myTerminal/set-up-package-lists))
(myTerminal/configure-basic-mode-packages)
(myTerminal/configure-full-mode-packages) ;To be removed
(myTerminal/set-file-associations)
(myTerminal/configure-interface)
(myTerminal/define-personal-functions)
(myTerminal/define-basic-mode-keyboard-bindings)
(myTerminal/define-full-mode-keyboard-bindings) ;To be removed
(myTerminal/apply-temporary-configurations)
