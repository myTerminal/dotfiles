;;; nlinum.el --- Show line numbers in the margin  -*- lexical-binding: t -*-

;; Copyright (C) 2012, 2014  Free Software Foundation, Inc.

;; Author: Stefan Monnier <monnier@iro.umontreal.ca>
;; Keywords: convenience
;; Version: 1.2

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is like linum-mode, but uses jit-lock to be (hopefully)
;; more efficient.

;;; News:

;; v1.2:
;; - New global mode `global-nlinum-mode'.
;; - New config var `nlinum-format-function'.

;;; Code:

(require 'linum)                        ;For its face.

(defvar nlinum--width 2)
(make-variable-buffer-local 'nlinum--width)

;; (defvar nlinum--desc "")

;;;###autoload
(define-minor-mode nlinum-mode
  "Toggle display of line numbers in the left margin (Linum mode).
With a prefix argument ARG, enable Linum mode if ARG is positive,
and disable it otherwise.  If called from Lisp, enable the mode
if ARG is omitted or nil.

Linum mode is a buffer-local minor mode."
  :lighter nil ;; (" NLinum" nlinum--desc)
  (jit-lock-unregister #'nlinum--region)
  (remove-hook 'window-configuration-change-hook #'nlinum--setup-window t)
  (remove-hook 'after-change-functions #'nlinum--after-change)
  (kill-local-variable 'nlinum--line-number-cache)
  (remove-overlays (point-min) (point-max) 'nlinum t)
  ;; (kill-local-variable 'nlinum--ol-counter)
  (kill-local-variable 'nlinum--width)
  (when nlinum-mode
    (add-hook 'window-configuration-change-hook #'nlinum--setup-window nil t)
    (add-hook 'after-change-functions #'nlinum--after-change nil t)
    (jit-lock-register #'nlinum--region t))
  (nlinum--setup-windows))

(defun nlinum--setup-window ()
  (set-window-margins nil (if nlinum-mode nlinum--width)
                      (cdr (window-margins))))

(defun nlinum--setup-windows ()
  (dolist (win (get-buffer-window-list nil nil t))
    (with-selected-window win (nlinum--setup-window))))

(defun nlinum--flush ()
  (nlinum--setup-windows)
  ;; (kill-local-variable 'nlinum--ol-counter)
  (remove-overlays (point-min) (point-max) 'nlinum t)
  (run-with-timer 0 nil
                  (lambda (buf)
                    (with-current-buffer buf
                      (with-silent-modifications
                        (remove-text-properties
                         (point-min) (point-max) '(fontified)))))
                  (current-buffer)))

;; (defun nlinum--ol-count ()
;;   (let ((i 0))
;;     (dolist (ol (overlays-in (point-min) (point-max)))
;;       (when (overlay-get ol 'nlinum) (incf i)))
;;     i))

;; (defvar nlinum--ol-counter 100)
;; (make-variable-buffer-local 'nlinum--ol-counter)

;; (defun nlinum--flush-overlays (buffer)
;;   (with-current-buffer buffer
;;     (kill-local-variable 'nlinum--ol-counter)
;;     ;; We've created many overlays in this buffer, which can slow
;;     ;; down operations significantly.  Let's flush them.
;;     ;; An easy way to flush them is
;;     ;;   (remove-overlays min max 'nlinum t)
;;     ;;   (put-text-property min max 'fontified nil)
;;     ;; but if the visible part of the buffer requires more than
;;     ;; nlinum-overlay-threshold overlays, then we'll inf-loop.
;;     ;; So let's be more careful about removing overlays.
;;     (let ((windows (get-buffer-window-list nil nil t))
;;           (start (point-min))
;;           (debug-count (nlinum--ol-count)))
;;       (with-silent-modifications
;;         (while (< start (point-max))
;;           (let ((end (point-max)))
;;             (dolist (window windows)
;;               (cond
;;                ((< start (1- (window-start window)))
;;                 (setq end (min (1- (window-start window)) end)))
;;                ((< start (1+ (window-end window)))
;;                 (setq start (1+ (window-end window))))))
;;             (when (< start end)
;;               (remove-overlays start end 'nlinum t)
;;               ;; Warn jit-lock that this part of the buffer is not done any
;;               ;; more.  This has the downside that font-lock will be re-applied
;;               ;; as well.  But jit-lock doesn't know how to (and doesn't want
;;               ;; to) keep track of the status of its various
;;               ;; clients independently.
;;               (put-text-property start end 'fontified nil)
;;               (setq start (+ end 1))))))
;;       (let ((debug-new-count (nlinum--ol-count)))
;;         (message "Flushed %d overlays, %d remaining"
;;                  (- debug-count debug-new-count) debug-new-count)))))


(defvar nlinum--line-number-cache nil)
(make-variable-buffer-local 'nlinum--line-number-cache)

(defun nlinum--after-change (&rest _args)
  (setq nlinum--line-number-cache nil))

(defun nlinum--line-number-at-pos ()
  "Like `line-number-at-pos' but sped up with a cache."
  ;; (assert (bolp))
  (let ((pos
         (if (and nlinum--line-number-cache
                  (> (- (point) (point-min))
                     (abs (- (point) (car nlinum--line-number-cache)))))
             (funcall (if (> (point) (car nlinum--line-number-cache))
                          #'+ #'-)
                      (cdr nlinum--line-number-cache)
                      (count-lines (point) (car nlinum--line-number-cache)))
           (line-number-at-pos))))
    ;;(assert (= pos (line-number-at-pos)))
    (setq nlinum--line-number-cache (cons (point) pos))
    pos))

(defvar nlinum-format-function
  (lambda (line)
    (let* ((fmt (format "%%%dd" nlinum--width))
           (str (propertize (format fmt line) 'face 'linum)))
      str))
  "Function to build the string representing the line number.
Takes one argument (the line number) and returns a string whose width
should be at least equal to `nlinum--width'.")

(defun nlinum--region (start limit)
  (save-excursion
    ;; Text may contain those nasty intangible properties, but
    ;; that shouldn't prevent us from counting those lines.
    (let ((inhibit-point-motion-hooks t))
      (goto-char start)
      (unless (bolp) (forward-line 1))
      (remove-overlays (point) limit 'nlinum t)
      (let ((line (nlinum--line-number-at-pos)))
        (while
            (and (not (eobp)) (< (point) limit)
                 (let* ((ol (make-overlay (point) (1+ (point))))
                        (str (funcall nlinum-format-function line))
                        (width (string-width str)))
                   (when (< nlinum--width width)
                     (setq nlinum--width width)
                     (nlinum--flush))
                   (overlay-put ol 'nlinum t)
                   (overlay-put ol 'evaporate t)
                   (overlay-put ol 'before-string
                                (propertize " " 'display
                                            `((margin left-margin) ,str)))
                   ;; (setq nlinum--ol-counter (1- nlinum--ol-counter))
                   ;; (when (= nlinum--ol-counter 0)
                   ;;   (run-with-idle-timer 0.5 nil #'nlinum--flush-overlays
                   ;;                        (current-buffer)))
                   (setq line (1+ line))
                   (zerop (forward-line 1))))))))
  ;; (setq nlinum--desc (format "-%d" (nlinum--ol-count)))
  nil)

;;;###autoload
(define-globalized-minor-mode global-nlinum-mode nlinum-mode
  (lambda () (unless (minibufferp) (nlinum-mode))))

;;;; ChangeLog:

;; 2014-01-02  Stefan Monnier  <monnier@iro.umontreal.ca>
;; 
;; 	* nlinum.el: Add global-nlinum-mode and nlinum-format-function.
;; 
;; 2012-10-24  Stefan Monnier  <monnier@iro.umontreal.ca>
;; 
;; 	* nlinum.el: Speed up by caching last line-number.
;; 	(nlinum--line-number-cache): New var.
;; 	(nlinum--after-change, nlinum--line-number-at-pos): New functions.
;; 	(nlinum-mode, nlinum--region): Use them.
;; 
;; 2012-06-08  Stefan Monnier  <monnier@iro.umontreal.ca>
;; 
;; 	Add nlinum.el
;; 


(provide 'nlinum)
;;; nlinum.el ends here
