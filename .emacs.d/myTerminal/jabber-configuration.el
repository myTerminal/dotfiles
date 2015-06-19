;Configure jabber accounts
(setq jabber-account-list
      '(("ismaila@citiusim.mumbai1.corp.citiustech.com" 
	 (:network-server . "citiusim.mumbai1.corp.citiustech.com"))
        ("team.terminal@gmail.com" 
	 (:network-server . "talk.google.com")
	 (:connection-type . ssl))))

;Disable jabber alerts
(setq jabber-alert-presence-message-function 
      (lambda (who 
               oldstatus 
               newstatus 
               statustext) 
        nil))

;Wrapper function for jabber notifications
(defun myTerminal/custom-notification-for-jabber
    nil)

;Jabber notification timer
(defvar myTerminal/notification-timer
  nil)

;Set jabber notification colors
(defvar myTerminal/notification-colors
  '("Red"
    "Green"
    "Yellow"
    "Blue"))

;Set jabber alert message hook
(add-hook 'jabber-alert-message-hooks
          'myTerminal/custom-notification-for-jabber)

(defun myTerminal/show-jabber-notification ()
  "Start timer for visual notification"
  (myTerminal/dismiss-jabber-notification)
  (setq myTerminal/notification-timer
        (run-at-time 0
                     2
                     'myTerminal/flash-screen)))

(defun myTerminal/dismiss-jabber-notification ()
  "Dismiss visual notification"
  (interactive)
  (cond ((null myTerminal/notification-timer) (message "No notifications!"))
        (t (cancel-timer myTerminal/notification-timer))))

(defun myTerminal/flash-screen ()
  "Flash screen once"
  (set-face-background 'fringe
                       (nth (random (length myTerminal/notification-colors))
                            myTerminal/notification-colors))
  (run-at-time 1
               nil
               (lambda (x)
                 (set-face-background 'fringe
                                      nil))
               t))

(defun myTerminal/switch-to-visual-notification-for-jabber ()
  "Switch to visual notification"
  (setq visible-bell
        nil)
  (fset 'myTerminal/custom-notification-for-jabber
        (lambda (from
                 buffer
                 text
                 propsed-alert)
          (myTerminal/show-jabber-notification))))

(defun myTerminal/switch-to-taskbar-notification-for-jabber ()
  "Switch to taskbar notification"
  (setq visible-bell
        t)
  (fset 'myTerminal/custom-notification-for-jabber
        (lambda (from
                 buffer
                 text
                 propsed-alert)
          (ding))))

(myTerminal/switch-to-visual-notification-for-jabber)

(add-hook 'focus-in-hook 
          'myTerminal/switch-to-visual-notification-for-jabber)
(add-hook 'focus-out-hook 
          'myTerminal/switch-to-taskbar-notification-for-jabber)
