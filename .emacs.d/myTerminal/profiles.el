(defun myTerminal/apply-temporary-configurations ()
  (theme-looper-enable-theme 'subtle-hacker))

(defun myTerminal/activate-profile-home ()
  (custom-set-faces
   '(default ((t (:height 180)))))
  (myTerminal/progress-to-full-mode))

(defun myTerminal/activate-profile-office ()
  (custom-set-faces
   '(default ((t (:height 120)))))
  (set-frame-size (selected-frame) 100 30)
  (find-file "~/../../data/to-do.org")
  (myTerminal/progress-to-full-mode))
