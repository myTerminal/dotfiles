;Start in basic-mode
(myTerminal/user/set-user-preferences)
(myTerminal/repositories/set-up-repositories)
(myTerminal/packages/fetch-remote-packages)
(myTerminal/packages/load-local-packages)
(myTerminal/packages/configure-packages)
(myTerminal/jabber/configure-jabber)
(myTerminal/file-associations/set-file-associations)
(myTerminal/interface/configure-interface)
(myTerminal/key-bindings/apply-keyboard-bindings)
(myTerminal/misc/print-welcome-message)

;Load local configuration
(theme-looper-enable-theme myTerminal/local-configs/color-theme)
(custom-set-faces
 `(default ((t (:height ,myTerminal/local-configs/font-height)))))
(set-frame-size (selected-frame)
                (car myTerminal/local-configs/frame-dimensions)
                (cdr myTerminal/local-configs/frame-dimensions))
