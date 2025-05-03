(setq user-full-name
      "Mohammed Ismail Ansari")
(setq user-mail-address
      "team.terminal@gmail.com")

(if (featurep 'theme-looper)
    (theme-looper-set-favorite-themes '(overcast
                                        material
                                        green-phosphor
                                        hemisu-dark
                                        leuven)))
(if (featurep 'zone-quotes) ; TODO: Fix
    (load "zone-quotes-masseffect"))
(if (featurep 'perspective)
    (customize-set-variable 'persp-state-default-file
                            (concat "~/_store/Vault/"
                                    "super-emacs-persp-session-file")))
