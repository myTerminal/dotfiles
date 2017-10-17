;;; emacs-sounds.el --- Sound effects for Emacs

;; This file is not part of Emacs

;; Author: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Keywords: fun, sounds
;; Package-Version: 20171017.1215
;; Maintainer: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Created: 2016/12/11
;; Package-Requires: ((sound-wav "20160725.724"))
;; Description: Sound effects for Emacs
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
;;     (require 'emacs-sounds)
;;
;; Enable emacs-sounds-mode globally with `(emacs-sounds-mode)` for Emacs to
;; play sounds at various events.
;;
;; You need to configure your own sounds for the package to be able to work.
;; Set `emacs-sounds-bell-sound`, `emacs-sounds-window-change-sound`
;; and `emacs-sounds-find-file-sound` with paths of sound files to be played
;; at the respective events. Sound files must be '.wav' audio files.
;;

;;; Commentary:

;;     You can use this package to make Emacs play sounds at various events.
;;
;;  Overview of features:
;;
;;     o   Play sounds at events
;;     o   Configurable sounds for various events
;;

;;; Code:

(defvar emacs-sounds-bell-sound
  nil)

(defvar emacs-sounds-window-change-sound
  nil)

(defvar emacs-sounds-find-file-sound
  nil)

(defun emacs-sounds-play-ring-bell-sound ()
  (emacs-sounds--play-sound emacs-sounds-bell-sound))

(defun emacs-sounds-play-window-change-sound ()
  (emacs-sounds--play-sound emacs-sounds-window-change-sound))

(defun emacs-sounds-play-find-file-sound ()
  (emacs-sounds--play-sound emacs-sounds-find-file-sound))

;;;###autoload
(define-minor-mode emacs-sounds-mode
  "Toggle emacs-sounds-mode"
  :init-value nil
  :global t
  :lighter " emacs-sounds"
  (cond (emacs-sounds-mode (progn
                             (setq ring-bell-function
                                   'emacs-sounds-play-ring-bell-sound)

                             (add-hook 'window-configuration-change-hook
                                       'emacs-sounds-play-window-change-sound)

                             (add-hook 'find-file-hook
                                       'emacs-sounds-play-find-file-sound)

                             (message "Emacs has just turned a bit noisier :)")))
        (t (progn
             (setq ring-bell-function
                   nil)

             (remove-hook 'window-configuration-change-hook
                          'emacs-sounds-play-window-change-sound)

             (remove-hook 'find-file-hook
                          'emacs-sounds-play-find-file-sound)

             (message "Emacs is now quite again!")))))

(defun emacs-sounds--play-sound (sound-file)
  (cond ((not (null sound-file)) (sound-wav-play sound-file))))

(provide 'emacs-sounds)

;;; emacs-sounds.el ends here
