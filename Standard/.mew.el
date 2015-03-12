(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

(setq read-mail-command 'mew)
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

;ismail.ansari@citustech.com
(setq mew-name "Ismail Ansari")
(setq mew-user "ismail.ansari@citiustech.com")
(setq mew-mail-domain "secure.emailsrvr.com")

(setq mew-smtp-user "ismail.ansari@citiustech.com")
(setq mew-smtp-server "secure.emailsrvr.com")

(setq mew-proto "%")
(setq mew-imap-user "ismail.ansari@citiustech.com")
(setq mew-imap-server "secure.emailsrvr.com")

