;;Prompt to select a configuration to start Emacs with
(let ((available-configs (directory-files "~/.emacs.d/configs"
                                          nil
                                          "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)"))
      (selected-config nil))
  (cond ((= (length available-configs) 1) (setq selected-config
                                                (car available-configs)))
	(t (setq selected-config
		 (ido-completing-read "Select a configuration:"
                                      available-configs))))
  (load (expand-file-name (concat "configs/"
				  selected-config
				  "/.emacs.d/init")
			  (file-name-directory load-file-name))))
