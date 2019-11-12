(progn
  (setq jabber-account-list
        '(("ismaila@citiusim.mumbai1.corp.citiustech.com"
           (:network-server . "citiusim.mumbai1.corp.citiustech.com"))
          ("team.terminal@gmail.com"
           (:network-server . "talk.google.com")
           (:connection-type . ssl))))

  (setq jabber-alert-presence-message-function
        (lambda (who
                 oldstatus
                 newstatus
                 statustext)
          nil))

  (defun mt/custom-notification-for-jabber
      nil)

  (defvar mt/notification-timer
    nil)

  (defvar mt/notification-colors
    '("Red"
      "Green"
      "Yellow"
      "Blue"))

  (add-hook 'jabber-alert-message-hooks
            'mt/custom-notification-for-jabber)

  (defun mt/show-jabber-notification ()
    "Start timer for visual notification"
    (mt/dismiss-jabber-notification)
    (setq mt/notification-timer
          (run-at-time 0
                       2
                       'mt/flash-screen)))

  (defun mt/dismiss-jabber-notification ()
    "Dismiss visual notification"
    (interactive)
    (cond ((null mt/notification-timer) (message "No notifications!"))
          (t (cancel-timer mt/notification-timer))))

  (defun mt/flash-screen ()
    "Flash screen once"
    (set-face-background 'fringe
                         (nth (random (length mt/notification-colors))
                              mt/notification-colors))
    (run-at-time 1
                 nil
                 (lambda (x)
                   (set-face-background 'fringe
                                        nil))
                 t))

  (defun mt/switch-to-visual-notification-for-jabber ()
    "Switch to visual notification"
    (setq visible-bell
          nil)
    (fset 'mt/custom-notification-for-jabber
          (lambda (from
                   buffer
                   text
                   propsed-alert)
            (mt/show-jabber-notification))))

  (defun mt/switch-to-taskbar-notification-for-jabber ()
    "Switch to taskbar notification"
    (setq visible-bell
          t)
    (fset 'mt/custom-notification-for-jabber
          (lambda (from
                   buffer
                   text
                   propsed-alert)
            (ding))))

  (mt/switch-to-visual-notification-for-jabber)

  (add-hook 'focus-in-hook
            'mt/switch-to-visual-notification-for-jabber)
  (add-hook 'focus-out-hook
            'mt/switch-to-taskbar-notification-for-jabber))
