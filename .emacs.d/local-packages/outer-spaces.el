;;; outer-spaces.el --- A minimalistic minor-mode to highlight redundant spaces

;; This file is not part of Emacs

;; Author: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Keywords: programming
;; Maintainer: Mohammed Ismail Ansari <team.terminal@gmail.com>
;; Created: 2016/11/29
;; Description: A minimalistic minor-mode to highlight redundant spaces
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
;;     (require 'outer-spaces)
;;
;; Enable outer-spaces-mode in any buffer to highlight spaces in that buffer.
;; Disabling minor-mode will unhighlight the highlighted spaces.
;;

;;; Commentary:

;;     You can use this package to highlight annoying empty spaces at the end of
;;     a line or the ones that appear on an empty line.
;;
;;  Overview of features:
;;
;;     o   Highlight redundant spaces in a buffer
;;

;;; Code:

;;;###autoload
(define-minor-mode outer-spaces-mode
  "Toggle outer-spaces-mode"
  :init-value nil
  :lighter " outer-spaces"
  (cond (outer-spaces-mode (progn (highlight-regexp " +$"
                                                    'outer-spaces-line-end-face)
                                  (highlight-regexp "^ +$"
                                                    'outer-spaces-line-start-face)))
        (t (progn (unhighlight-regexp " +$")
                  (unhighlight-regexp "^ +$")))))

(defface outer-spaces-line-start-face
  '((t (:background "white")))
  "Used in outer-spaces for spaces at the start of an empty line.")

(defface outer-spaces-line-end-face
  '((t (:background "red")))
  "Used in outer-spaces for spaces at the end of a line.")

(provide 'outer-spaces)

;;; outer-spaces.el ends here
