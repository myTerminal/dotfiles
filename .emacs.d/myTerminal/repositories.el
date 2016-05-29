(defun myTerminal/set-up-repositories ()
  (require 'package)

  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") 
               t)

  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/")
               t)

  (package-initialize))
