;;;;;;;;;;;;;;;;;;;;;;;; Repositories ;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

;Add marmalade package repository
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

;Add melpa package repository
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;; User Settings ;;;;;;;;;;;;;;;;;;;;;;;;

;Set author-name
(setq user-full-name "Ismail Ansari")

;;;;;;;;;;;;;;;;;;;;;;;; Visual Tweaks ;;;;;;;;;;;;;;;;;;;;;;;;

;Invert colors
;(invert-face 'default)

;Load black theme
(load-theme 'alect-black t)

;Change font
(set-frame-font "Inconsolata" nil t)

;;;;;;;;;;;;;;;;;;;;;;;; Interface Tweaks ;;;;;;;;;;;;;;;;;;;;;;;;

;Disable toolbar
(tool-bar-mode -1)

;Start ido-mode
(ido-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;; Libraries ;;;;;;;;;;;;;;;;;;;;;;;;

;Add emacs directory
(add-to-list 'load-path "~/.emacs.d/")

;Start alpha (installed thru ELPA)
(require 'alpha)
(global-set-key (kbd "C-}") 'transparency-increase)
(global-set-key (kbd "C-{") 'transparency-decrease)

;Load multiple-cursors
(add-to-list 'load-path "~/.emacs.d/multiple-cursors-master/")
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;Load auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-1.3.1/dict")
(ac-config-default)

;Start autopair (installed thru ELPA)
(require 'autopair)
(autopair-global-mode)

;;;;;;;;;;;;;;;;;;;;;;;; Others ;;;;;;;;;;;;;;;;;;;;;;;;

;Add js2-mode as the major mode for JavaScript editing
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;Add team.terminal@gmail as Gtalk account
(setq jabber-account-list
    '(("team.terminal@gmail.com" 
       (:network-server . "talk.google.com")
       (:connection-type . ssl))))

;Add ismail.ansari@citiustech.com as another account
(setq jabber-account-list
    '(("ismaila@citiusim.mumbai1.corp.citiustech.com" 
       (:network-server . "citiusim.mumbai1.corp.citiustech.com")
       (:connection-type . ssl))))
