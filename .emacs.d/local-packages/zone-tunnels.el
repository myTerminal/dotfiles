;;; zone-tunnels.el --- A zone program inspired from the old DOS game

;; This file is not part of Emacs

;; Author: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Keywords: games
;; Package-Version: 20180309.2155
;; Maintainer: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Created: 2018/03/08
;; Package-Requires: ((emacs "24"))
;; Description: A zone program inspired from the old DOS game
;; URL: http://ismail.teamfluxion.com
;; Compatibility: Emacs24


;; COPYRIGHT NOTICE
;;
;; This program is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2 of the License, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
;; or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
;; for more details.
;;

;;; Install:

;; Put this file on your Emacs-Lisp load path and add the following to your
;; ~/.emacs startup file
;;
;;     (require 'zone-tunnels)
;;
;; Set 'zone-pgm-tunnels' as one of the zone programs
;;
;;     (setq zone-programs
;;           [zone-pgm-tunnels])
;;
;; and activate zoning by specifying a delay
;;
;;     (zone-when-idle 30)
;;
;; Alternatively you can run 'zone-tunnels' directly
;;
;;     (zone-tunnels)
;;

;;; Commentary:

;;     A zone program inspired from the old DOS game
;;
;;  Overview of features:
;;
;;     o   Zone out with tunnels
;;

;;; Code:

(defun zone-tunnels--draw-rect (canvas-width canvas-height rect-width rect-height)
  (let ((start-x (/ (- canvas-width
                        rect-width)
                     2))
         (start-y (/ (- canvas-height
                        rect-height)
                     2)))

    (beginning-of-buffer)
    (forward-line start-y)
    (forward-char start-x)
    (delete-char rect-width)
    (insert (make-string rect-width ?*))
    (dotimes (index (- rect-height
                       2))
      (forward-line 1)
      (move-beginning-of-line nil)
      (forward-char start-x)
      (delete-char 1)
      (insert "*")
      (backward-char 1)
      (forward-char (1- rect-width))
      (delete-char 1)
      (insert "*"))
    (forward-line 1)
    (move-beginning-of-line nil)
    (forward-char start-x)
    (delete-char rect-width)
    (insert (make-string rect-width ?*))))

;;;###autoload
(defun zone-pgm-tunnels ()
  "Zone out with tunnels."
  (delete-other-windows)
  (erase-buffer)
  (zone-fill-out-screen (window-width) (window-height))
  (setq cursor-type nil)
  (let ((render-index 10)
         (aspect-ratio 2))
    (while (not (input-pending-p))
      (let ((canvas-width (window-width))
             (canvas-height (1- (window-height))))
        (dotimes (number canvas-height)
          (insert (concatenate 'string
                               (make-string canvas-width
                                            ? )
                               "\n")))
        (let ((width (- canvas-width
                        (* (% render-index
                              10)
                           aspect-ratio)))
              (height (- canvas-height
                         (% render-index
                            10))))
          (loop while
                (and (> width 3)
                     (> height 3))
                do
                (zone-tunnels--draw-rect canvas-width
                                         canvas-height
                                         width
                                         height)
                (setq width (- width
                               (* 10
                                  aspect-ratio)))
                (setq height (- height
                                10))))
        (sit-for 0.1)
        (erase-buffer)
        (setq render-index
              (+ render-index
                 8))))))

;;;###autoload
(defun zone-tunnels ()
  "Zone out with tunnels."
  (interactive)
  (let ((zone-programs [zone-pgm-tunnels]))
    (zone)))

(provide 'zone-tunnels)

;;; zone-tunnels.el ends here
