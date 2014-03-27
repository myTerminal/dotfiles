;;;;;;;;;;;;;;;;;;;;;;;; Repositories ;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

;Add marmalade package repository
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

;Add melpa package repository
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;; User Settings ;;;;;;;;;;;;;;;;;;;;;;;;

;Set author-name
(setq user-full-name "Ismail Ansari")

;;;;;;;;;;;;;;;;;;;;;;;; Interface Tweaks ;;;;;;;;;;;;;;;;;;;;;;;;

;Disable tool-bar
(tool-bar-mode -1)

;Disable scroll-bar
(scroll-bar-mode -1)

;Invert colors
;(invert-face 'default)

;Activate wombat color-theme
(load-theme 'wombat)

;Set font
(set-frame-font "Inconsolata" nil t)

;Set zoning preferences
(require 'zone)
(setq zone-programs [zone-pgm-drip])
(zone-when-idle 20)
(global-set-key (kbd "C-!")
		'zone-leave-me-alone)

;Enable ido-mode
(ido-mode 1)

;Enable column-number mode
(column-number-mode)

;Enable show-paren-mode
(show-paren-mode)

;Enable highlighting on current line
(global-hl-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;; Libraries ;;;;;;;;;;;;;;;;;;;;;;;;

;Add emacs directory
(add-to-list 'load-path 
	     "~/.emacs.d/")

;Load alpha, set key-bindings
(require 'alpha)
(global-set-key (kbd "C-}") 
		'transparency-increase)
(global-set-key (kbd "C-{") 
		'transparency-decrease)

;Load multiple-cursors, set key-bindings
(add-to-list 'load-path 
	     "~/.emacs.d/multiple-cursors-master/")
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 
		'mc/edit-lines)
(global-set-key (kbd "C->") 
		'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 
		'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 
		'mc/mark-all-like-this)

;Load auto-complete, set dictionary
(add-to-list 'load-path 
	     "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories 
	     "~/.emacs.d/auto-complete-1.3.1/dict")
(ac-config-default)

;Load autopair, start by default
(require 'autopair)
(autopair-global-mode)

;Set up linum-mode
(global-nlinum-mode t)

;Load e2wm, set key-bindings
(require 'e2wm)
(global-set-key (kbd "C-|") 
		'e2wm:start-management)

;Start undo-tree, set key-bindings
(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "M-/")
		'undo-tree-visualize)

;Set up markdown mode
(autoload 'markdown-mode 
  "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist 
	     '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist 
	     '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist 
	     '("\\.md\\'" . markdown-mode))

;Load dirtree
(require 'dirtree)

;Set up ace-jump-mode
(autoload 'ace-jump-mode 
  "ace-jump-mode" 
  "Emacs quick move minor mode"
  t)
(global-set-key (kbd "C-c SPC") 
		'ace-jump-mode)
(autoload 'ace-jump-mode-pop-mark 
  "ace-jump-mode" 
  "Ace jump back:-"
  t)
(global-set-key (kbd "C-x SPC") 
		'ace-jump-mode-pop-mark)

;Add hooks for column-enforce-mode
(add-hook 'emacs-lisp-mode-hook 
	  'column-enforce-mode)
(add-hook 'js2-mode-hook
	  'column-enforce-mode)

;Load theme-looper, set key-bindings
(require 'theme-looper)
(tl:set-theme-set (list 'deeper-blue 
			'manoj-dark 
			'tango-dark 
			'tsdh-dark 
			'wheatgrass 
			'wombat))
(global-set-key (kbd "C-\"") 
		'tl:enable-next-theme)

;;;;;;;;;;;;;;;;;;;;;;;; Miscellaneous ;;;;;;;;;;;;;;;;;;;;;;;;

;Add js2-mode as the major mode for JavaScript editing
(add-to-list 'auto-mode-alist 
	     '("\\.js\\'" . js2-mode))

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
