;;Prompt to select a configuration to start Emacs with
(let ((choices (directory-files "~/.emacs.d/configs"
                                nil
                                "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)")))
  (load (expand-file-name (concat "configs/"
                                  (ido-completing-read "Select a configuration:" choices)
                                  "/.emacs.d/init")
                          (file-name-directory load-file-name))))
