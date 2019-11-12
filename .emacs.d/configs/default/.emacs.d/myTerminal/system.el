(defun mt/system/set-system-preferences ()
  (setq custom-file
        (concat mt/config-root
		"custom.el"))

  (setq package--init-file-ensured
        t))
