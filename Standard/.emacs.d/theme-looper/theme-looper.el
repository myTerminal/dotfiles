;;; theme-looper.el --- Loop thru the available color-themes

;; This file is not part of Emacs

;; Author: Ismail Ansari team.terminal@aol.in
;; Keywords: convinience, color-themes
;; Maintainer: Ismail Ansari team.terminal@aol.in
;; Created: 2014/03/22
;; Description: Loop thru the available color-themes with a key-binding
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

;; Put this file on your Emacs-Lisp load path, add following into your
;; ~/.emacs startup file
;;
;;     (require 'theme-looper)
;;
;; And set a key-binding for cycling thru themes
;;
;;     (global-set-key (kbd "C-|") 'tl:enable-next-theme)
;;
;; You can also set your list of favorite themes
;;
;;     (tl:set-theme-set (list 'wombat 'tango-dark 'wheatgrass))
;;

;;; Commentary:

;;     You can use this package to cycle thru the available themes in Emacs 24
;;     with a key-binding of your choice. Just a key combination to switch to
;;     the next theme.
;;
;;  Overview of features:
;;
;;     o   Automatically cycle thru the available color themes
;;     o   Provides an option to select a list of your favorite color themes
;;

;;; Code:

(defvar tl:favorite-themes)  

(defun tl:set-theme-set (themes)
  "Sets the list of color-themes to cycle thru"
  (setq tl:favorite-themes 
	themes))

(defun tl:get-current-theme ()
  "Determines the currently enabled theme"
  (car custom-enabled-themes))

(defun tl:get-current-theme-index ()
  "Finds the currently enabled color-theme in the list of color-themes"
  (position (tl:get-current-theme)
	    tl:favorite-themes :test #'equal))

(defun tl:get-next-theme-index ()
  "Find the index of the next color-theme in the list, to be moved to"
  (let ((tl:current-theme-index (tl:get-current-theme-index)))
    (cond
     ((equal tl:current-theme-index
	     'nil)
      0)
     ((equal tl:current-theme-index
	     (- (length tl:favorite-themes)
		1))
      0)
     ((+ 1
	 tl:current-theme-index)))))

(defun tl:get-next-theme ()
  "Determines the next color-theme to be enabled"
  (nth (tl:get-next-theme-index)
       tl:favorite-themes))

(defun tl:disable-all-themes ()
  "Disables all the enabled color-themes"
  (mapcar 'disable-theme
	  custom-enabled-themes))

(defun tl:enable-next-theme ()
  "Enables the next color-theme in the list"
  (interactive)
  (let ((tl:next-theme (tl:get-next-theme)))
    (tl:disable-all-themes)
    (load-theme tl:next-theme)
    (message (concatenate 'string 
			  "Switched to theme: "
			  (symbol-name tl:next-theme))))
  )

(tl:set-theme-set (custom-available-themes))

(provide 'theme-looper)

;;; theme-looper.el ends here
