#!/usr/bin/sbcl --script

(defun get-device-id-and-name (arguments index)
  "Gets device name at index from among arguments."
  (let* ((remaining-sequence (subseq arguments index))
         (end-position (position "Device" remaining-sequence :test 'string-equal)))
    (subseq remaining-sequence
            0
            (or end-position
                (length remaining-sequence)))))

(defun get-device-info (arguments)
  "Gets device id and name pairs."
  (let ((index 0))
    (remove-if #'null
               (mapcar (lambda (p)
                         (incf index)
                         (if (equal "Device" p)
                             (get-device-id-and-name arguments index)
                             nil))
                       arguments))))

(defun main (arguments)
  "The main entry point of the program."
  (let* ((id-name-pairs (get-device-info arguments)))
    (princ (reduce (lambda (a b)
                     (concatenate 'string a "\\n" b))
                   (mapcar (lambda (elements)
                             (reduce (lambda (a b)
                                       (concatenate 'string a " " b))
                                     elements))
                           id-name-pairs)))))

;; Start
(main (cdr *posix-argv*))
