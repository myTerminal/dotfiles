;; Prompt to select a configuration to start Emacs with
(let ((configs (if (file-directory-p "~/.config/emacs/configs")
                   (directory-files "~/.config/emacs/configs"
                                    nil
                                    "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)"))))
  (if (null configs)
      (message "No configuration found!")
    (load (expand-file-name (concat "configs/"
				                    (cond ((cdr configs) (ido-completing-read
                                                          "Select a configuration: "
                                                          configs))
	                                      (t (car configs)))
				                    "/init")
			                (file-name-directory load-file-name)))))

;; Load user-specific config
(load (concat (file-name-directory user-init-file)
              "user")
      t)
