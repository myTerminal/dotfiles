;;Configure session
(mt/system/set-system-preferences)
(mt/user/set-user-preferences)
(mt/repositories/set-up-repositories)
(mt/packages/fetch-remote-packages)
(mt/packages/configure-quelpa)
(mt/packages/configure-packages)
(mt/jabber/configure-jabber)
(mt/file-associations/set-file-associations)
(mt/interface/configure-interface)
(mt/key-bindings/apply-keyboard-bindings)
(mt/print-welcome-message)

;;Load local configuration
(theme-looper-enable-theme mt/local-configs/color-theme)
(custom-set-faces
 `(default ((t (:family ,mt/local-configs/font-family-default)))))
(add-hook 'prog-mode-hook
          (lambda ()
            (setq buffer-face-mode-face `(:family ,mt/local-configs/font-family-programming))
            (buffer-face-mode)))
(custom-set-faces
 `(default ((t (:height ,mt/local-configs/font-height)))))
(set-frame-size (selected-frame)
                (car mt/local-configs/frame-dimensions)
                (cdr mt/local-configs/frame-dimensions))
