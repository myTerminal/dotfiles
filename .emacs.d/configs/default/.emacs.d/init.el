(defvar myTerminal/invokation-time
  (current-time))

(defvar myTerminal/config-root
  (file-name-directory load-file-name))

(defvar myTerminal/base-path
  (concat myTerminal/config-root
	  "myTerminal/"))

(defun myTerminal/load-file (file-path)
  "Loads the specified file from local configuration"
  (load (concat myTerminal/base-path
                file-path)))

(myTerminal/load-file "system")
(myTerminal/load-file "user")
(myTerminal/load-file "repositories")
(myTerminal/load-file "packages")
(myTerminal/load-file "jabber-configuration")
(myTerminal/load-file "file-associations")
(myTerminal/load-file "interface")
(myTerminal/load-file "misc")
(myTerminal/load-file "key-bindings")

(myTerminal/load-file "default-local-configs")
(if (file-exists-p (concat myTerminal/config-root
			   "local-configs.el"))
    (load-file (concat myTerminal/config-root
		       "local-configs.el")))

(myTerminal/load-file "startup")

(myTerminal/load-file "_zone-quotes-masseffect")
