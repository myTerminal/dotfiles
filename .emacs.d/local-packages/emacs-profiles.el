;;; emacs-profiles.el --- Configuration profiles for Emacs -*- lexical-binding: t; coding: utf-8; -*-

;; This file is not part of Emacs

;; Author: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Keywords: convenience, shortcuts
;; Package-Version: 20170101.1530
;; Maintainer: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Created: 2016/06/04
;; Package-Requires: ((emacs "24") (cl-lib "0.5") (prompt-you "20160925.1115"))
;; Description: Configuration profiles for Emacs
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
;;     (require 'emacs-profiles)
;;
;; Set a key-binding to open the configuration menu that displays all
;; configured configurations.
;;
;;     (global-set-key (kbd "C-M-`") 'emacs-profiles-show-menu)
;;
;; You can also define your configuration as
;;
;;     (emacs-profiles-set-profiles-data
;;         (list '("1" 
;;                 "Office" 
;;                 (lambda ()
;;                     (invert-face 'default)))
;;               '("2" 
;;                 "Home" 
;;                 (lambda ()
;;                     (menu-bar-mode -1)
;;                     (tool-bar-mode -1)
;;                     (scroll-bar-mode -1)))))
;;
;; Each item in the list should contain three elements:
;;
;; * Key to be pressed to load the profile
;; * Name of the profile
;; * A function to be executed against the key, the function that contains all
;;   scripts to be executed to apply that particular configuration.
;;
;; Lastly, you can also call `emacs-profiles-show-menu` at startup so that
;; you can choose which profile to start Emacs in when you start it.
;;

;;; Commentary:

;;     You can use emacs-profiles to switch between multiple set of
;;     configurations at a couple of key-presses.
;;
;;  Overview of features:
;;
;;     o   Quickly configure your Emacs to behave in a specific way
;;     o   Groups a lot of toggles into a single window
;;

;;; Code:

(require 'cl-lib)

(defvar emacs-profiles--profiles-data
  nil)

;;;###autoload
(defun emacs-profiles-set-profiles-data (data)
  (setq emacs-profiles--profiles-data
        data))

;;;###autoload
(defun emacs-profiles-show-menu ()
  (interactive)
  (prompt-you-now "Select a profile to load:"
                  emacs-profiles--profiles-data
                  "Loaded profile: "))

(emacs-profiles-set-profiles-data 
 (list '("0" "Stock Emacs"
         (lambda ()))))

(provide 'emacs-profiles)

;;; emacs-profiles.el ends here
