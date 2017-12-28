;;; window-shaper.el --- A utility to easily resize windows within Emacs

;; This file is not part of Emacs

;; Author: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Keywords: windows
;; Package-Version: 20171218.1222
;; Maintainer: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Created: 2017/12/28
;; Description: A utility to easily resize windows within Emacs
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

;; Put this file on your Emacs-Lisp load path, add following into your
;; ~/.emacs startup file
;;
;;     (require 'window-shaper)
;;
;; Enable window-shaper-mode in any buffer to be able to use single keystrokes
;; to resize windows.
;;
;;     (window-shaper-mode)
;;
;; You can also set a key-binding to enable `window-shaper-mode' from any
;; buffer.
;;
;;     (global-set-key (kbd "C-x C-#") 'window-shaper-mode)
;;
;; Once the `window-shaper-mode' is enabled you can use the following shortcuts:
;;
;; right: increase window width
;; left: decrease window width
;; up: increase window height
;; down: decrease window height
;; q: disable window-shaper-mode
;;

;;; Commentary:

;;     You can use this package to resize windows with a press of a single key.
;;
;;  Overview of features:
;;
;;     o   Resize windows
;;

;;; Code:

;;;###autoload
(define-minor-mode window-shaper-mode
  "Toggle window-shaper-mode"
  :init-value nil
  :global: t
  :lighter " window-shaper"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "<right>") 'enlarge-window-horizontally)
            (define-key map (kbd "<left>") 'shrink-window-horizontally)
            (define-key map (kbd "<up>") 'enlarge-window)
            (define-key map (kbd "<down>") 'shrink-window)
            (define-key map (kbd "q") 'window-shaper-mode)
            map)
  (if window-shaper-mode
      (message "Resize windows with arrow keys <right>, <left>, <up> and <down>. Press 'q' when done.")))

(provide 'window-shaper)

;;; window-shaper.el ends here