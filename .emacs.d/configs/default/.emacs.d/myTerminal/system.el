(defun myTerminal/system/set-system-preferences ()
  (setq custom-file
        (concat myTerminal/config-root
		"custom.el"))

  (setq package--init-file-ensured
        t))
