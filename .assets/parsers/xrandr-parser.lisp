#!/usr/bin/sbcl --script

(defun get-device-names (arguments state)
  "Gets device id and name pairs."
  (let ((index 0))
    (remove-if #'null
               (mapcar (lambda (p)
                         (incf index)
                         (if (equal state p)
                             (nth (- index 2) arguments)
                             nil))
                       arguments))))

(defun main (arguments)
  "The main entry point of the program."
  (let* ((choice (car arguments))
         (devices-info (cdr arguments))
         (connected-devices (get-device-names devices-info "connected"))
         (primary-device (car connected-devices))
         (disconnected-devices (get-device-names devices-info "disconnected")))
    (princ (cond ((string-equal choice "connected") connected-devices)
                 ((string-equal choice "disconnected") disconnected-devices)
                 (t primary-device)))))

;; Start
(main (cdr *posix-argv*))
