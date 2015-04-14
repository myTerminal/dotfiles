;Load alpha
(require 'alpha)

;Load default auto-complete configs
(ac-config-default)

;Add js2-mode as the major mode for JavaScript editing
(add-to-list 'auto-mode-alist 
	     '("\\.js\\'" . js2-mode))

;Set hook for ac-js2-mode
(add-hook 'js2-mode-hook 
          'ac-js2-mode)

;Set inferior program command for js-comint
(setq inferior-js-program-command 
      "node --interactive")

;Start by default
(autopair-global-mode)

;Set up linum-mode
(global-nlinum-mode t)

;Start undo-tree
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

;Enable powerline
(powerline-center-theme)
(setq powerline-default-separator
      'wave)

;Enable logging of all commands in command-log-mode
(setq clm/log-command-exceptions*
      nil)

;Set up haskell-mode
(add-hook 'haskell-mode-hook 
          'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 
          'inf-haskell-mode)
(add-hook 'haskell-mode-hook 
          'turn-on-haskell-indentation)
(add-to-list 'completion-ignored-extensions 
             ".hi")

;Load theme-looper
(add-to-list 'load-path
	     "~/.emacs.d/other-plugins/theme-looper")
(require 'theme-looper)
(tl:set-theme-set (list 'deeper-blue
                        'wheatgrass
                        'wombat
                        'arjen
                        'retro-green
                        'retro-orange
                        'julie
                        'monokai))
(tl:set-customizations 'powerline-reset)

;Load meta-presenter
(add-to-list 'load-path
	     "~/.emacs.d/other-plugins/meta-presenter")
(require 'meta-presenter)

;Add 'replace-colorthemes' to the list of installed color-themes
(add-to-list 'custom-theme-load-path
             "~/.emacs.d/other-plugins/replace-colorthemes")
