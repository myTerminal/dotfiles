;;Determine config root path
(defvar mt/config-root
  (file-name-directory load-file-name))

;;Load core.el
(load (expand-file-name "myTerminal/core"
			mt/config-root))

;;Load config files sequentially
(mt/load-file "config-system")
(mt/load-file "config-user-variables")
(mt/load-file "config-workstation-variables")
(mt/load-file "config-interface")
(mt/load-file "config-repositories")
(mt/load-file "config-packages")
(mt/load-file "config-jabber")
(mt/load-file "config-file-associations")
(mt/load-file "config-key-bindings")
(mt/load-file "_zone-quotes-masseffect")

;;Finish startup
(mt/print-welcome-message)
(mt/load-personalization-variables)
