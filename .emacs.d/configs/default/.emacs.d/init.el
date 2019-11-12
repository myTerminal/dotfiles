(defvar mt/invokation-time
  (current-time))

(defvar mt/config-root
  (file-name-directory load-file-name))

(defvar mt/base-path
  (concat mt/config-root
	  "myTerminal/"))

(defun mt/load-file (file-path)
  "Loads the specified file from local configuration"
  (load (concat mt/base-path
                file-path)))

(mt/load-file "system")
(mt/load-file "user")
(mt/load-file "repositories")
(mt/load-file "packages")
(mt/load-file "jabber-configuration")
(mt/load-file "file-associations")
(mt/load-file "interface")
(mt/load-file "misc")
(mt/load-file "key-bindings")

(mt/load-file "default-local-configs")
(if (file-exists-p (concat mt/config-root
			   "local-configs.el"))
    (load-file (concat mt/config-root
		       "local-configs.el")))

(mt/load-file "startup")

(mt/load-file "_zone-quotes-masseffect")
