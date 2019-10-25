(defvar myTerminal/invokation-time
  (current-time))

(load-file "~/.emacs.d/myTerminal/system.el")
(load-file "~/.emacs.d/myTerminal/user.el")
(load-file "~/.emacs.d/myTerminal/repositories.el")
(load-file "~/.emacs.d/myTerminal/packages.el")
(load-file "~/.emacs.d/myTerminal/jabber-configuration.el")
(load-file "~/.emacs.d/myTerminal/file-associations.el")
(load-file "~/.emacs.d/myTerminal/interface.el")
(load-file "~/.emacs.d/myTerminal/misc.el")
(load-file "~/.emacs.d/myTerminal/key-bindings.el")

(load-file "~/.emacs.d/myTerminal/default-local-configs.el")
(if (file-exists-p "~/.emacs.d/local-configs.el")
    (load-file "~/.emacs.d/local-configs.el"))

(load-file "~/.emacs.d/myTerminal/startup.el")

(load-file "~/.emacs.d/myTerminal/_zone-quotes-masseffect.el")
