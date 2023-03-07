;;Prompt to select a configuration to start Emacs with
(let ((available-configs (if (file-directory-p "~/.config/emacs/configs")
                             (directory-files "~/.config/emacs/configs"
                                              nil
                                              "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)")
                           '()))
      (selected-config nil))
  (if (null available-configs)
      (message "No configs found")
    (progn
      (cond ((= (length available-configs) 1) (setq selected-config
                                                    (car available-configs)))
	    (t (setq selected-config
		     (ido-completing-read "Select a configuration:"
                                          available-configs))))
      (load (expand-file-name (concat "configs/"
				      selected-config
				      "/init")
			      (file-name-directory load-file-name))))))

;; Load user-specific config
(load (concat (file-name-directory user-init-file)
              "user"))
