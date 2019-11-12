;;Determine config root path
(defvar mt/config-root
  (file-name-directory load-file-name))

;;Load core.el
(load (expand-file-name "myTerminal/core"
			mt/config-root))

(mt/load-file "config-system")
(mt/load-file "config-user")
(mt/load-file "config-local-configs")
(mt/load-file "config-repositories")
(mt/load-file "config-packages")
(mt/load-file "config-jabber-configuration")
(mt/load-file "config-file-associations")
(mt/load-file "config-interface")
(mt/load-file "config-key-bindings")
(mt/load-file "_zone-quotes-masseffect")

(mt/print-welcome-message)
(mt/load-personalization-variables)
