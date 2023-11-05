#!/usr/bin/sbcl --script

(defun string-to-list (input-string char)
  "Converts a string containing NewLine characters into a list of strings."
  (let* ((temp-chars '())
         (items '()))
    (labels ((to-string (chars)
               (coerce (reverse chars) 'string))
             (collect-item ()
               (push (to-string temp-chars) items)
               (setf temp-chars '())))
      (mapc (lambda (c)
              (cond ((eql c char) (collect-item))
                    (t (push c temp-chars))))
            (coerce input-string 'list))
      (collect-item)
      (reverse items))))

(defun main (arguments)
  "The main entry point of the program."
  (let* ((choice (car arguments))
         (xrandr-devices (cdr arguments))
         (connected-devices (concatenate 'list
                                         (mapcar (lambda (x)
                                                   (car (string-to-list x #\ )))
                                                 (remove-if-not (lambda (x)
                                                                  (string-equal (cadr (string-to-list x #\ )) "connected"))
                                                                xrandr-devices))))
         (primary-device (car connected-devices))
         (disconnected-devices (concatenate 'list
                                            (mapcar (lambda (x)
                                                      (car (string-to-list x #\ )))
                                                    (remove-if-not (lambda (x)
                                                                     (string-equal (cadr (string-to-list x #\ )) "disconnected"))
                                                                   xrandr-devices)))))
    (princ (cond ((string-equal choice "connected") connected-devices)
                 ((string-equal choice "disconnected") disconnected-devices)
                 (t primary-device)))))

;; Start
(main (cdr *posix-argv*))
