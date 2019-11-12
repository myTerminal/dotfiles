(defvar mt/local-configs/color-theme nil)
(defvar mt/local-configs/font-family-default nil)
(defvar mt/local-configs/font-family-programming nil)
(defvar mt/local-configs/font-height nil)
(defvar mt/local-configs/frame-dimensions nil)
(defvar mt/local-configs/daily-events nil)
(defvar mt/local-configs/day-start-time nil)
(defvar mt/local-configs/day-end-time nil)
(defvar mt/local-configs/favorite-files nil)
(defvar mt/local-configs/favorite-functions nil)

;; Override below values locally
(setq mt/local-configs/color-theme
      'overcast)

(setq mt/local-configs/font-family-default
      "Liberation Mono")

(setq mt/local-configs/font-family-programming
      "Fira Code")

(setq mt/local-configs/font-height
      150)

(setq mt/local-configs/frame-dimensions
      (cons 100
            30))

(setq mt/local-configs/daily-events
      (list '("1155" "Lunch time")
            '("1655" "End of day")))

(setq mt/local-configs/day-start-time
      0800)

(setq mt/local-configs/day-end-time
      1700)

(setq mt/local-configs/favorite-files
      (list '("t" "~/to-do.org")))

(setq mt/local-configs/favorite-functions
      (list '("c" calc)))
