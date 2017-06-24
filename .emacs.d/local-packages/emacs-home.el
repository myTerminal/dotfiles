;;; emacs-home.el --- A home-screen for Emacs -*- lexical-binding: t; coding: utf-8; -*-

;; This file is not part of Emacs

;; Author: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Keywords: convenience, shortcuts
;; Package-Version: 20170624.1315
;; Maintainer: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Created: 2017/06/24
;; Package-Requires: ((emacs "24") (cl-lib "0.5"))
;; Description: A home-screen for Emacs
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
;;     (require 'emacs-home)
;;
;; Currently *emacs-home* supports the following widgets:
;; 
;; 1. Date and Time
;; 2. Work-day progress
;; 3. Pinned files
;; 4. Pinned functions
;; 
;; Set a key-binding to open the configuration menu that displays all configured
;; configurations.
;; 
;;     (global-set-key (kbd "C-;") 'emacs-home-show)
;; 
;; By default, only the date-time widget is shown. One needs to set a few
;; variables to see rest of the widgets.
;; 
;; To see the work-day progress widget, set the day start and end times. These
;; need to be set with numeric values in the format *hhmm*. Refer the below
;; example.
;; 
;;     (emacs-home-set-day-start-time
;;         0800)
;;     (emacs-home-set-day-end-time
;;         1700)
;; 
;; If the current time is between the above two times, a progress-bar is shown.
;; 
;; To see the pinned files widget, use a snippet as shown below.
;; 
;;     (emacs-home-set-pinned-files (list '("t" "~/to-do.org")
;;                                        '("i" "~/Documents/work.md")))
;; 
;; To see the pinned functions widget, use a snippet as shown below.
;; 
;;     (emacs-home-set-pinned-functions (list '("s" snake)
;;                                            '("c" calc)))
;; 
;; While on the home-screen, pressing `g` updates it and `q` closes it.
;;

;;; Commentary:

;;     You can use *emacs-home* as a home-screen to place shortcuts and view
;;     useful information about your day.
;;
;;  Overview of features:
;;
;;     o   Quickly open up a screen with useful information and shortcuts
;;

;;; Code:

(require 'cl-lib)

(defvar emacs-home--buffer-name
  " *emacs-home*")

(defvar emacs-home--refresh-timer
  nil)

(defvar emacs-home--data-day-start-time
  nil)

(defvar emacs-home--data-day-end-time
  nil)

(defvar emacs-home--data-pinned-files
  nil)

(defvar emacs-home--data-pinned-functions
  nil)

;;;###autoload
(defun emacs-home-set-day-start-time (time)
  (setq emacs-home--data-day-start-time
        time))

;;;###autoload
(defun emacs-home-set-day-end-time (time)
  (setq emacs-home--data-day-end-time
        time))

;;;###autoload
(defun emacs-home-set-pinned-files (files)
  (setq emacs-home--data-pinned-files
        files))

;;;###autoload
(defun emacs-home-set-pinned-functions (functions)
  (setq emacs-home--data-pinned-functions
        functions))

;;;###autoload
(defun emacs-home-show ()
  (interactive)
  (let ((my-buffer (get-buffer-create emacs-home--buffer-name)))
    (set-window-buffer (get-buffer-window)
                       my-buffer)
    (other-window 1)
    (emacs-home--render-controls)
    (setq emacs-home--refresh-timer
          (run-with-timer 1
                          1
                          'emacs-home--redraw))))

(defun emacs-home--render-controls ()
  (emacs-home--print-date-and-time)
  (emacs-home--print-day-progress)
  (emacs-home--print-pinned-files)
  (emacs-home--print-pinned-functions)
  (emacs-home-mode)
  (emacs-home--apply-other-commands-bindings)
  (emacs-home--apply-pinned-files-bindings)
  (emacs-home--apply-pinned-functions-bindings))

(defun emacs-home--print-date-and-time ()
  (insert (cl-concatenate 'string
                          (propertize (format-time-string "%A, %d %B %Y")
                                      'face
                                      '(:height 2.0))
                          "\n\n"))
  (insert (cl-concatenate 'string
                          (propertize (format-time-string "%H:%M:%S")
                                      'face
                                      '(:height 4.0 :inverse-video t))
                          "\n\n")))

(defun emacs-home--print-day-progress ()
  (cond ((not (or (null emacs-home--data-day-start-time)
                  (null emacs-home--data-day-end-time)))
         (let ((day-progress-ratio (emacs-home--get-day-progress)))
           (insert (cl-concatenate 'string
                                   (make-string (window-width)
                                                ?*)
                                   "\n"))
           (insert (cl-concatenate 'string
                                   (propertize (cond ((not (null day-progress-ratio))
                                                      (make-string (truncate (* 100
                                                                                day-progress-ratio))
                                                                   ?*))
                                                     (t "Outside working hours"))
                                               'face
                                               '(:inverse-video t))
                                   "\n"))
           (insert (cl-concatenate 'string
                                   (make-string (window-width)
                                                ?*)
                                   "\n"))))))

(defun emacs-home--get-day-progress ()
  (let ((start-minutes (+ (* 60
                             (truncate (/ emacs-home--data-day-start-time
                                          100)))
                          (mod emacs-home--data-day-start-time
                               100)))
        (end-minutes (+ (* 60
                           (truncate (/ emacs-home--data-day-end-time
                                        100)))
                        (mod emacs-home--data-day-end-time
                             100)))
        (ellapsed-minutes (+ (* 60
                                (string-to-number (format-time-string "%H")))
                             (string-to-number (format-time-string "%M")))))
    (cond ((and (> end-minutes
                   start-minutes)
                (>= ellapsed-minutes
                    start-minutes)
                (<= ellapsed-minutes
                    end-minutes)) (/ (* (- ellapsed-minutes
                                           start-minutes)
                                        1.0)
                                     (- end-minutes
                                        start-minutes)))
          (t nil))))

(defun emacs-home--print-pinned-files ()
  (cond ((not (null emacs-home--data-pinned-files))
         (progn
           (insert (cl-concatenate 'string
                                   "\n"
                                   (propertize "Pinned files:" 'face '(:height 1.5 :underline t))
                                   "\n\n"))
           (mapc 'emacs-home--display-controls-binding
                 emacs-home--data-pinned-files)))))

(defun emacs-home--print-pinned-functions ()
  (cond ((not (null emacs-home--data-pinned-functions))
         (progn
           (insert (cl-concatenate 'string
                                   "\n"
                                   (propertize "Pinned functions:" 'face '(:height 1.5 :underline t))
                                   "\n\n"))
           (mapc 'emacs-home--display-controls-binding
                 emacs-home--data-pinned-functions)))))

(defun emacs-home--display-controls-binding (object)
  (insert (cl-concatenate 'string
                          (propertize (cl-concatenate 'string
                                                      " "
                                                      (nth 0 
                                                           object)
                                                      " ")
                                      'face
                                      '(:box t))
                          " "
                          (emacs-home--get-displayable-symbol (cadr object))
                          "\n")))

(defun emacs-home--get-displayable-symbol (item)
  (cond ((symbolp item) (symbol-name item))
        (t item)))

(defun emacs-home--apply-other-commands-bindings ()
  (local-set-key (kbd "g")
                 'emacs-home--redraw)
  (local-set-key (kbd "q")
                 (lambda ()
                   (interactive)
                   (emacs-home--hide))))

(defun emacs-home--apply-pinned-files-bindings ()
  (mapc (lambda (object)
          (funcall #'emacs-home--apply-pinned-file-binding
                   object))
        emacs-home--data-pinned-files))

(defun emacs-home--apply-pinned-file-binding (object)
  (local-set-key (kbd (car object))
                 (lambda ()
                   (interactive)
                   (emacs-home--hide)
                   (find-file (cadr object)))))

(defun emacs-home--apply-pinned-functions-bindings ()
  (mapc (lambda (object)
          (funcall #'emacs-home--apply-pinned-function-binding
                   object))
        emacs-home--data-pinned-functions))

(defun emacs-home--apply-pinned-function-binding (object)
  (local-set-key (kbd (car object))
                 (lambda ()
                   (interactive)
                   (emacs-home--hide)
                   (funcall (cadr object)))))

(defun emacs-home--hide ()
  (let ((my-window (get-buffer-window (get-buffer-create emacs-home--buffer-name))))
    (emacs-home--stop-timer)
    (cond ((windowp my-window)
           (kill-buffer (get-buffer-create emacs-home--buffer-name))))))

(defun emacs-home--redraw ()
  (interactive)
  (emacs-home--hide)
  (emacs-home-show))

(defun emacs-home--stop-timer ()
  (cancel-timer emacs-home--refresh-timer))

(define-derived-mode emacs-home-mode 
  special-mode 
  "emacs-home"
  :abbrev-table nil
  :syntax-table nil
  (setq cursor-type nil))

(provide 'emacs-home)

;;; emacs-home.el ends here
