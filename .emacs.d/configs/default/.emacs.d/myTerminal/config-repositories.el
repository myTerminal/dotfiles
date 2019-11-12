(defun mt/repositories/set-up-repositories ()
  (require 'package)

  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/")
               t)

  (package-initialize))
