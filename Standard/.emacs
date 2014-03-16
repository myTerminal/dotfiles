;;;;;;;;;;;; Visual Tweaks ;;;;;;;;;;;;

;Invert colors
(invert-face 'default)

;Change font
(set-frame-font "Inconsolata" nil t)

;;;;;;;;;;;; Interface Tweaks ;;;;;;;;;;;;

;Disable toolbar
(tool-bar-mode -1)

;Start ido-mode
(ido-mode 1)

;;;;;;;;;;;; Repositories ;;;;;;;;;;;;

;Add marmalade package repository
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
;(package-initialize)

;;;;;;;;;;;; Libraries ;;;;;;;;;;;;

;Add emacs directory
(add-to-list 'load-path "~/.emacs.d/")

;Load multiple-cursors
(add-to-list 'load-path "~/.emacs.d/multiple-cursors-master/")
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;;;;;;;;;;; Others ;;;;;;;;;;;;

;Add js2-mode as the major mode for JavaScript editing
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;Add team.terminal@gmail as Gtalk account
(setq jabber-account-list
    '(("team.terminal@gmail.com" 
       (:network-server . "talk.google.com")
       (:connection-type . ssl))))
