(defun myTerminal/apply-temporary-configurations ()
  (theme-looper-enable-theme 'deep-blue))

(defun myTerminal/activate-profile-home ()
  (set-frame-size (selected-frame) 100 30))

(defun myTerminal/activate-profile-office ()
  (custom-set-faces
   '(default ((t (:family "Inconsolata" :height 140)))))
  (find-file "~/../../data/to-do.org"))
