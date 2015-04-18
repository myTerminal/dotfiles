;;; myTerminal-controls.el --- Quick toggle controls at a key-stroke

;; This file is not part of Emacs

;; Author: Ismail Ansari team.terminal@aol.in
;; Keywords: convenience, shortcuts
;; Maintainer: Ismail Ansari team.terminal@aol.in
;; Created: 2015/04/17
;; Description: Quick toggle controls at a key-stroke
;; URL: http://ismail.teamfluxion.com, http://www.teamfluxion.com
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
;;     (require 'myTerminal-controls)
;;
;; Set a key-binding to open the quick-toggle controls window anytime
;;
;;     (global-set-key (kbd "C-M-`") 'myTerminal-controls:open-controls)
;;
;; You can also set your custom list of quick-toggle controls
;;
;;     (myTerminal-controls:set-controls-data
;;         (list '("1" "Invert colors" (lambda ()
;;                                         (invert-face 'default)))
;;               '("2" "Invert mode-line" (lambda ()
;;                                            (invert-face 'mode-line)))))
;;
;; Each item in the list should contain three elements:
;;
;; * Key combination information
;; * Text to be displayed in the controls window
;; * Function to be executed against the key combination
;;

;;; Commentary:

;;     You can use myTerminal-controls to save a lot of key-bindings by grouping
;;     them into a single controls window. The controls window can be opened
;;     with a key-binding and the rest key-bindings are displayed within the
;;     controls window.
;;
;;  Overview of features:
;;
;;     o   Saves key-bindings for simple toggle operations
;;     o   Groups a lot of toggles into a single window
;;

;;; Code:

;; -*- coding: utf-8; lexical-binding: t; -*-

(require 'cl-lib)

(defvar myTerminal-controls:controls-data
  nil)

(defvar myTerminal-controls:buffer-name
  " *myTerminal-controls*")

(defun myTerminal-controls:set-controls-data (data)
  "Sets details of controls required in the controls window"
  (setq myTerminal-controls:controls-data
        data)
  (add-to-list 'myTerminal-controls:controls-data
               '("q" "Close" (lambda ()
                               (myTerminal-controls:close-controls)))
               t))

(defun myTerminal-controls:open-controls ()
  "Opens the controls window"
  (interactive)
  (setq my-buffer
        (get-buffer-create myTerminal-controls:buffer-name))
  (setq my-window (split-window-vertically -20))
  (set-window-buffer my-window
                     my-buffer)
  (other-window 1)
  (myTerminal-controls:prepare-controls myTerminal-controls:controls-data))

(defun myTerminal-controls:close-controls ()
  "Closes the controls window"
  (interactive)
  (let ((my-window (get-buffer-window (get-buffer-create myTerminal-controls:buffer-name))))
    (cond ((windowp my-window) (progn
                                 (delete-window my-window)
                                 (kill-buffer (get-buffer-create myTerminal-controls:buffer-name)))))))

(defun myTerminal-controls:prepare-controls (pairs)
  "Sets up the controls window"
  (mapc 'myTerminal-controls:display-controls-bindings
        pairs)
  (myTerminal-controls-mode)
  (mapc 'myTerminal-controls:apply-keyboard-bindings
        pairs))

(defun myTerminal-controls:apply-keyboard-bindings (pair)
  "Applies key-bindings with a wrapper"
  (lexical-let ((func (nth 2
                           pair)))
    (local-set-key (kbd (car pair))
                   (lambda ()
                     (interactive)
                     (other-window -1)
                     (funcall func)
                     (other-window 1)))))

(defun myTerminal-controls:display-controls-bindings (pair)
  "Display controls in the controls window"
  (princ (concatenate 'string
                      "["
                      (nth 0 
                           pair)
                      "] - "
                      (nth 1
                           pair)
                      "\n")
         (get-buffer-create myTerminal-controls:buffer-name)))

(define-derived-mode myTerminal-controls-mode 
  special-mode 
  "myTerminal-controls"
  :abbrev-table nil
  :syntax-table nil
  nil)

(myTerminal-controls:set-controls-data 
 (list '("1" "Toggle menu-bar" (lambda ()
                                 (cond (menu-bar-mode (menu-bar-mode -1))
                                       (t (menu-bar-mode t)))))
       '("2" "Toggle tool-bar" (lambda ()
                                 (cond (tool-bar-mode (tool-bar-mode -1))
                                       (t (tool-bar-mode t)))))
       '("3" "Toggle scroll-bar" (lambda ()
                                   (cond (scroll-bar-mode (scroll-bar-mode -1))
                                         (t (scroll-bar-mode t)))))
       '("4" "Invert colors" (lambda ()
                               (invert-face 'default)))))

(provide 'myTerminal-controls)

;;; myTerminal-controls.el ends here
