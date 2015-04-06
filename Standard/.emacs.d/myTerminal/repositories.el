;Load package.el
(require 'package)

;Add old elpa to the list of repositories
(add-to-list 'package-archives
             '("elpa-old" . "http://tromey.com/elpa/")
             t)

;Add melpa to list of repositories
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") 
             t)

;Add marmalade to list of repositories
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")
             t)

;Initialize package.el
(package-initialize)
