(if (or (null (cdr command-line-args))
        (null (seq-filter #'file-exists-p (cdr command-line-args))))
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
			                    (file-name-directory load-file-name))))))

(load (concat (file-name-directory user-init-file)
              "user")
      t)
