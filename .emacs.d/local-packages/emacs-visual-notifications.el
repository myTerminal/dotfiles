;;; emacs-visual-notifications.el --- A utility to create visual notifications in emacs -*- lexical-binding: t; coding: utf-8; -*-

;; This file is not part of Emacs

;; Author: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Keywords: library
;; Package-Version: 20180707.2135
;; Maintainer: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Created: 2017/09/07
;; Package-Requires: ((emacs "24") (cl-lib "0.5"))
;; Description: A utility to create visual notifications in emacs
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
;;     (require 'emacs-visual-notifications)
;;
;; Currently, the following notifications are supported
;;
;; 1. flash once
;;
;;     (emacs-visual-notification-flash-once 1)
;;
;; The above code flashes the screen only once for 1 second
;;
;; 2. flash for a particular number of times
;;
;;     (emacs-visual-notification-flash 3
;;         1
;;         2)
;;
;; The above code flashes the screen 3 times, the flash lasts for 1 second
;; and the gap between two flashes is 2 seconds
;;
;; 3. flash until user interaction (coming soon)
;;
;;     (emacs-visual-notification-flash-until-active 1
;;         2)
;;
;; The above code flashes the screen until the user performs any gesture. The
;; flash lasts for 1 second and the gap between two flashes is 2 seconds.
;;

;;; Commentary:

;;     You can use emacs-visual-notifications to create visual notifications
;;     of various kinds in emacs
;;
;;  Overview of features:
;;
;;     o   Create visual notifications to the user
;;

;;; Code:

(require 'cl-lib)

;;;###autoload
(defun emacs-visual-notification-flash-once (duration-on)
  "Flashes the screen once"
  (interactive)
  (emacs-visual-notifications--flash-screen duration-on))

;;;###autoload
(defun emacs-visual-notification-flash (count duration-on duration-off)
  "Flashes the screen repeatedly"
  (interactive)
  (let ((counter 0)
        (timer nil))
    (setq timer
          (run-at-time 0
                       (+ duration-on duration-off)
                       (lambda (x)
                         (emacs-visual-notifications--flash-screen duration-on)
                         (cl-incf counter)
                         (cond ((= counter
                                   count) (cancel-timer timer))))
                       t))))

;;;###autoload
(defun emacs-visual-notification-flash-until-active (duration-on duration-off)
  "Flashes the screen repeatedly until user action"
  (interactive)
  (message "Not implemented"))

(defun emacs-visual-notifications--flash-screen (duration-on)
  (invert-face 'default)
  (run-at-time duration-on
               nil
               (lambda (x)
                 (invert-face 'default))
               t))

(provide 'emacs-visual-notifications)

;;; emacs-visual-notifications.el ends here
