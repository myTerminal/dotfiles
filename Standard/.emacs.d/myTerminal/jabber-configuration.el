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

(defun myTerminal/custom-notification-for-jabber
  nil)

(add-hook 'jabber-alert-message-hooks
          'myTerminal/custom-notification-for-jabber)

(defun myTerminal/flash-screen ()
  (invert-face 'default)
  (run-at-time 0.25
               nil
               (lambda (x)
                 (invert-face 'default))
               t))

(defun myTerminal/switch-to-visual-notification-for-jabber ()
  (setq visible-bell
        nil)
  (fset 'myTerminal/custom-notification-for-jabber
        (lambda (from
                 buffer
                 text
                 propsed-alert)
          (myTerminal/flash-screen))))

(defun myTerminal/switch-to-taskbar-notification-for-jabber ()
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
