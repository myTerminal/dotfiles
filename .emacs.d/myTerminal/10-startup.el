;;Configure session
(myTerminal/system/set-system-preferences)
(myTerminal/user/set-user-preferences)
(myTerminal/repositories/set-up-repositories)
(myTerminal/packages/fetch-remote-packages)
(myTerminal/packages/configure-quelpa)
(myTerminal/packages/configure-packages)
(myTerminal/jabber/configure-jabber)
(myTerminal/file-associations/set-file-associations)
(myTerminal/interface/configure-interface)
(myTerminal/key-bindings/apply-keyboard-bindings)
(myTerminal/misc/print-welcome-message)

;;Load local configuration
(theme-looper-enable-theme myTerminal/local-configs/color-theme
                           nil)
(custom-set-faces
 `(default ((t (:family ,myTerminal/local-configs/font-family-default)))))
(add-hook 'prog-mode-hook
          (lambda ()
            (setq buffer-face-mode-face `(:family ,myTerminal/local-configs/font-family-programming))
            (buffer-face-mode)))
(custom-set-faces
 `(default ((t (:height ,myTerminal/local-configs/font-height)))))
(set-frame-size (selected-frame)
                (car myTerminal/local-configs/frame-dimensions)
                (cdr myTerminal/local-configs/frame-dimensions))
