;;; meta-presenter.el --- A simple experiment turned presenter for Emacs 24

;; This file is not part of Emacs

;; Author: Ismail Ansari team.terminal@aol.in
;; Keywords: productivity, presentation
;; Maintainer: Ismail Ansari team.terminal@aol.in
;; Created: 2014/12/22
;; Description: A simple experiment turned presenter for Emacs 24
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
;;     (require 'meta-presenter)
;;
;; Create a directory that contains slides to be presented stored as files.
;; Name the files as the slide number followed by an underscore, followed by
;; the name of the slide. Below are some examples:
;;
;;     o   1_introduction.md
;;     o   2_getting-started.md
;;     o   3_advanced-features.md
;;
;; Create a separate title slide for the presentation, start the presentation
;; mode while viewing the file. For example, if the directory containing your
;; slides contains a *title.md* file, you can run `mp:start-presentation` while
;; having the file open in the buffer where you would like the presenation to
;; start. When the presentation starts, you'll be taken to a buffer named
;; *slide-show.md*.
;;
;; In order to move to the next slide, run `mp:move-to-next-slide`.
;; Moving back to the previous slide is obviously `mp:move-to-previous-slide`.
;;
;; I have taken the liberty to assign <F5>, <F7> and <F8> to the functions
;; `mp:start-presentation`, `mp:move-to-previous-slide`
;; and `mp:move-to-next-slide` respectively for convenience.
;;

;;; Commentary:

;;     You can use this package to present a slide-show using Emacs 24.
;;     Presenting is as simple as creating slides and a title slide and
;;     hitting the <F5> key.
;;
;;  Overview of features:
;;
;;     o   Yet another presentation tool for Emacs 24
;;

;;; Code:

(defvar mp:current-directory)

(defvar mp:slide-count)

(defvar mp:current-slide-number)

(defvar mp:progress-percentage)

(defvar mp:index-file)

(defvar mp:enable-animations nil)

(defun mp:increment (n)
  "Increments a number"
  (1+ n))

(defun mp:decrement (n)
  "Decrements a number"
  (- n 
     1))

(defun mp:start-presentation ()
  "Starts presentation mode"
  (interactive)
  (setq mp:current-directory
        (file-name-directory buffer-file-name))
  (setq mp:slide-count
        (length (file-expand-wildcards (concat mp:current-directory
                                      "*_*.md"))))
  (setq mp:index-file
        (file-name-nondirectory buffer-file-name))
  (setq mp:current-slide-number
        0)
  (switch-to-buffer (find-file-noselect "slide-show.md"))
  (erase-buffer)
  (insert-file-contents mp:index-file
                        nil)
  (beginning-of-buffer))

(defun mp:move-to-next-slide ()
  "Moves to the next slide"
  (interactive)
  (cond ((not (= mp:current-slide-number
                 mp:slide-count)) (progn (mp:slide-down)
                                         (erase-buffer)
                                         (mp:fill-in)
                                         (mp:paste-progress 1)
                                         (insert-file-contents (mp:get-next-slide-name) 
                                                               nil)
                                         (mp:slide-up)
                                         (mp:set-current-slide-number (mp:increment mp:current-slide-number))))
        (t (progn (message "End of slide-show!")))))

(defun mp:move-to-previous-slide ()
  "Moves to the previous slide"
  (interactive)
  (cond ((not (= mp:current-slide-number 
                 1)) (progn (mp:slide-down)
                            (erase-buffer)
                            (mp:fill-in)
                            (mp:paste-progress -1)
                            (insert-file-contents (mp:get-previous-slide-name) 
                                                  nil)
                            (mp:slide-up)
                            (mp:set-current-slide-number (mp:decrement mp:current-slide-number))))
        (t (progn (message "Already on the first slide!")))))

(defun mp:paste-progress (delta)
  "Pastes progress-bar on the screen"
  (setq mp:progress-percentage
        (/ (* (+ mp:current-slide-number
                 delta)
              100)
           mp:slide-count))
  (beginning-of-buffer)
  (insert (make-string (/ (* (window-width) 
                             mp:progress-percentage)
                          100)
                       ?|))
  (newline 2))

(defun mp:slide-down ()
  "Slides down the current slide"
  (cond (mp:enable-animations (dotimes (y (frame-height))
                                (beginning-of-buffer)
                                (insert (make-string (- (window-width)
                                                        2)
                                                     ?|))
                                (newline 1)
                                (sit-for 0.002)))))

(defun mp:fill-in ()
  "Fills the current screen with fillers"
  (cond (mp:enable-animations (dotimes (y (frame-height))
                                (insert (make-string (- (window-width)
                                                        2)
                                                     ?|))
                                (newline 1)))))

(defun mp:slide-up ()
  "Slides up the next slide"
  (cond (mp:enable-animations (dotimes (y (frame-height))
                                (beginning-of-buffer)
                                (kill-line)
                                (kill-line)
                                (sit-for 0.002)))))

(defun mp:set-current-slide-number (n)
  "Updates the current slide number"
  (setq mp:current-slide-number
        n))

(defun mp:get-next-slide-number ()
  "Gets the next slide number"
  (mp:increment mp:current-slide-number))

(defun mp:get-previous-slide-number ()
  "Gets the previous slide number"
  (mp:decrement mp:current-slide-number))

(defun mp:get-next-slide-name ()
  "Gets the next slide filename"
  (car (file-expand-wildcards (concat mp:current-directory
                                      (number-to-string (mp:get-next-slide-number))
                                      "_*"))))

(defun mp:get-previous-slide-name ()
  "Gets the previous slide filename"
  (car (file-expand-wildcards (concat mp:current-directory
                                      (number-to-string (mp:get-previous-slide-number))
                                      "_*"))))

(global-set-key (kbd "<f5>") 'mp:start-presentation)
(global-set-key (kbd "<f8>") 'mp:move-to-next-slide)
(global-set-key (kbd "<f7>") 'mp:move-to-previous-slide)

(provide 'meta-presenter)

;;; meta-presenter.el ends here
