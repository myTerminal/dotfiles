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
(if (featurep 'zone-quotes)
    (load "zone-quotes-masseffect"))

