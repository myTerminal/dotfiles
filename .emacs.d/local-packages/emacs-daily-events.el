;;; emacs-daily-events.el --- An Emacs package to notify you on specified daily occurring events -*- lexical-binding: t; coding: utf-8; -*-

;; This file is not part of Emacs

;; Author: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Keywords: library
;; Package-Version: 20180707.2135
;; Maintainer: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Created: 2017/09/11
;; Package-Requires: ((emacs "24") (cl-lib "0.5") (emacs-visual-notifications "20180707.2135"))
;; Description: An Emacs package to notify you on specified daily occurring events
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
;;     (require 'emacs-daily-events)
;;
;; Set the daily events you want to be notified on as shown below:
;;
;;     (emacs-daily-events-set-events (list '("0900" "Scrum meeting")
;;                                          '("1200" "Lunch time")
;;                                          '("1700" "End of day")))
;;
;; Enable the `emacs-daily-events-global-mode` by
;;
;;     (emacs-daily-events-global-mode)
;;
;; or
;;
;;     M-x emacs-daily-events-global-mode RET
;;
;; Emacs will visually notify you when one of the events occur by flashing the
;; screen a few times.
;;

;;; Commentary:

;;     An Emacs package to notify you on specified daily occurring events
;;
;;  Overview of features:
;;
;;     o   Get visual notification of set daily events
;;

;;; Code:

(require 'cl-lib)

(defvar emacs-daily-events--clock-timer
  nil)

(defvar emacs-daily-events--recent-event
  nil)

(defvar emacs-daily-events--data-events
  nil)

;;;###autoload
(defun emacs-daily-events-set-events (events)
  (setq emacs-daily-events--data-events
        events))

(defun emacs-daily-events--check-for-events ()
  (let* ((time-right-now (format-time-string "%H%M"))
         (event-times (mapcar 'car emacs-daily-events--data-events))
         (current-event (member time-right-now
                                event-times)))
    (cond ((and current-event
                (not (equal time-right-now
                            emacs-daily-events--recent-event)))
           (progn (emacs-visual-notification-flash 5
                                                   1
                                                   1)
                  (setq emacs-daily-events--recent-event
                        (car current-event)))))))

;;;###autoload
(define-minor-mode emacs-daily-events-global-mode
  "Toggle emace-home-global-mode"
  :init-value nil
  :global t
  :lighter " emacs-daily-events"
  (cond (emacs-daily-events-global-mode (progn (if (timerp emacs-daily-events--clock-timer)
                                                   (cancel-timer emacs-daily-events--clock-timer))
                                               (setq emacs-daily-events--clock-timer
                                                     (run-with-timer 0
                                                                     10
                                                                     'emacs-daily-events--check-for-events))))
        (t (progn (cancel-timer emacs-daily-events--clock-timer)
                  (setq emacs-daily-events--recent-event
                        nil)))))

(provide 'emacs-daily-events)

;;; emacs-daily-events.el ends here
