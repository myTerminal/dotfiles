;;; emacs-new-buffer.el --- Quickly create new buffers to take notes and more

;; This file is not part of Emacs

;; Author: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Keywords: convenience
;; Package-Version: 20190128.1912
;; Maintainer: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Created: 2017/10/26
;; Package-Requires: ((emacs "24"))
;; Description: Quickly create new buffers to take notes and more
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
;;     (require 'emacs-new-buffer)
;;
;; Quickly create a buffer with name as current timestamp
;;
;;     M-x emacs-new-buffer-now RET
;;
;; Create a buffer with a specific file extension (hence specific major mode)
;;
;;     M-x emacs-new-buffer-as RET
;;
;; This is useful when used with a key-binding:
;;
;;     (global-set-key (kbd "C-x t") 'emacs-new-buffer-now)
;;     (global-set-key (kbd "C-x y") 'emacs-new-buffer-as)
;;

;;; Commentary:

;;     You can use *emacs-new-buffer* to create new buffers with lesser
;;     key-presses
;;
;;  Overview of features:
;;
;;     o   Quickly create a buffer in fundamental mode
;;     o   Quickly create a buffer with a specific major-mode
;;

;;; Code:

(defun emacs-new-buffer-now ()
  "Creates a new buffer with timestamp as the name"
  (interactive)
  (let ((new-buffer-name (emacs-new-buffer--get-buffer-name)))
    (find-file (concat "~/"
                       "temp-"
                       new-buffer-name))))

(defun emacs-new-buffer-as (extension)
  "Creates a new buffer with timestamp as the name and extension as specified"
  (interactive "sEnter a file extension for the new buffer: ")
  (let ((new-buffer-name (emacs-new-buffer--get-buffer-name)))
    (find-file (concat "~/"
                       "temp-"
                       new-buffer-name
                       "."
                       extension))))

(defun emacs-new-buffer--get-buffer-name ()
  (format-time-string "%Y%m%d-%H%M%S"))

(provide 'emacs-new-buffer)

;;; emacs-new-buffer.el ends here
