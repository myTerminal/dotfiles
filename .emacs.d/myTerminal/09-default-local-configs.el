(defvar myTerminal/local-configs/color-theme nil)
(defvar myTerminal/local-configs/font-family-default nil)
(defvar myTerminal/local-configs/font-family-programming nil)
(defvar myTerminal/local-configs/font-height nil)
(defvar myTerminal/local-configs/frame-dimensions nil)
(defvar myTerminal/local-configs/daily-events nil)
(defvar myTerminal/local-configs/day-start-time nil)
(defvar myTerminal/local-configs/day-end-time nil)
(defvar myTerminal/local-configs/favorite-files nil)
(defvar myTerminal/local-configs/favorite-functions nil)

;; Override below values locally
(setq myTerminal/local-configs/color-theme
      'overcast)

(setq myTerminal/local-configs/font-family-default
      "Liberation Mono")

(setq myTerminal/local-configs/font-family-programming
      "Fira Code")

(setq myTerminal/local-configs/font-height
      150)

(setq myTerminal/local-configs/frame-dimensions
      (cons 100
            30))

(setq myTerminal/local-configs/daily-events
      (list '("1155" "Lunch time")
            '("1655" "End of day")))

(setq myTerminal/local-configs/day-start-time
      0800)

(setq myTerminal/local-configs/day-end-time
      1700)

(setq myTerminal/local-configs/favorite-files
      (list '("t" "~/to-do.org")))

(setq myTerminal/local-configs/favorite-functions
      (list '("c" calc)))
