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

;Disable backup
(setq backup-inhibited t)

;Disable auto save
(setq auto-save-default nil)

;;;;;;;;;;;;;;;;;;;;;;;; Interface Tweaks ;;;;;;;;;;;;;;;;;;;;;;;;

;Disable tool-bar
(tool-bar-mode -1)

;Disable scroll-bar
(scroll-bar-mode -1)

;Change cursor-type
(set-default 'cursor-type 'hbar)

;Invert colors
;(invert-face 'default)

;Activate deeper-blue color-theme
(load-theme 'deeper-blue)

;Set font
(set-frame-font "Inconsolata" nil t)
(set-face-attribute 'default nil 
		    :height 140)

;Set zoning preferences
(require 'zone)
(setq zone-programs [zone-pgm-putz-with-case])
(zone-when-idle 20)

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

;Load alpha
(require 'alpha)

;Load multiple-cursors
(add-to-list 'load-path 
	     "~/.emacs.d/other-plugins/multiple-cursors/")
(require 'multiple-cursors)

;Load auto-complete, set dictionary
(add-to-list 'load-path 
	     "~/.emacs.d/other-plugins/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories 
	     "~/.emacs.d/other-plugins/auto-complete-1.3.1/dict")
(ac-config-default)

;Set hook for ac-js2-mode
(add-hook 'js2-mode-hook 'ac-js2-mode)

;Load autopair, start by default
(require 'autopair)
(autopair-global-mode)

;Set up linum-mode
(global-nlinum-mode t)

;Load e2wm
(require 'e2wm)

;Start undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

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
(autoload 'ace-jump-mode-pop-mark 
  "ace-jump-mode" 
  "Ace jump back:-"
  t)

;Add hooks for column-enforce-mode
(add-hook 'emacs-lisp-mode-hook 
	  'column-enforce-mode)
(add-hook 'js2-mode-hook
	  'column-enforce-mode)

;Enable anzu-mode
(global-anzu-mode +1)

;Load theme-looper
(add-to-list 'load-path
	     "~/.emacs.d/other-plugins/theme-looper")
(require 'theme-looper)
(tl:set-theme-set (list 'deeper-blue 
			'manoj-dark 
			'tango-dark 
			'tsdh-dark 
			'wheatgrass 
			'wombat))

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

;;;;;;;;;;;;;;;;;;;;;;;; Key-bindings ;;;;;;;;;;;;;;;;;;;;;;;;

(defvar my-keyboard-bindings (list '("C-!" . zone-leave-me-alone)
				   '("C-M-)" . transparency-increase)
				   '("C-M-(" . transparency-decrease)
				   '("C-}" . mc/mark-next-like-this)
				   '("C-{" . mc/mark-previous-like-this)
				   '("C-|" . mc/mark-all-like-this)
				   '("C-M-]" . e2wm:start-management)
				   '("C-M-[" . e2wm:stop-management)
				   '("M-/" . undo-tree-visualize)
				   '("C->" . ace-jump-mode)
				   '("C-<" . ace-jump-mode-pop-mark)
				   '("C-\"" . tl:enable-next-theme)))

(defun apply-keyboard-bindings (pair)
  (global-set-key (kbd (car pair)) (cdr pair)))

(mapc 'apply-keyboard-bindings
      my-keyboard-bindings)
