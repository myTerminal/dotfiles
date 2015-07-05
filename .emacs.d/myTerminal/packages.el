;Create repositories cache, if required
(when (not package-archive-contents)
  (package-refresh-contents))

;Declare a list of required packages
(defvar myTerminal/required-packages
  (list 'helm
        'multiple-cursors
        'ace-jump-mode
        'smex
        'powerline
        'switch-window
        'web-mode
        'js2-mode
        'ac-js2
        'csharp-mode
        'markdown-mode
        'less-css-mode
        'haskell-mode
        'latex-preview-pane
        'auto-complete
        'autopair
        'column-enforce-mode
        'rainbow-delimiters
        'nlinum
        'undo-tree
        'anzu
        'command-log-mode
        'dirtree
        'minimap
        'magit
        'skewer-mode
        'restclient
        'mew
        'jabber
        'material-theme
        'monokai-theme
        'meta-presenter
        'myterminal-controls
        'theme-looper
        'marmalade-client
        'alpha))

;Install required packages
(mapc (lambda (p)
        (package-install p))
      myTerminal/required-packages)

;Load alpha
(require 'alpha)

;Load default auto-complete configs
(ac-config-default)

;Set hook for ac-js2-mode
(add-hook 'js2-mode-hook 
          'ac-js2-mode)

;Set inferior program command for js-comint
(setq inferior-js-program-command 
      "node --interactive")

;Start by default
(autopair-global-mode)

;Start undo-tree
(global-undo-tree-mode)

;Set up markdown mode
(autoload 'markdown-mode 
  "markdown-mode"
  "Major mode for editing Markdown files" t)

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

;Configure theme-looper
(theme-looper-set-theme-set (list 'deeper-blue
                        'wheatgrass
                        'wombat
                        'arjen
                        'retro-green
                        'retro-orange
                        'julie
                        'material
                        'monokai))
(theme-looper-set-customizations 'powerline-reset)

;Configure myterminal-controls
(myterminal-controls-set-controls-data
 (list '("t" "Change color theme" theme-looper-enable-next-theme)
       '("[" "Decrease transparency" transparency-decrease)
       '("]" "Increase transparency" transparency-increase)))

;Add 'replace-colorthemes' to the list of installed color-themes
(add-to-list 'custom-theme-load-path
             "~/.emacs.d/other-plugins/replace-colorthemes")

;Set up helm-mode
(helm-mode 1)
(helm-autoresize-mode 1)
(setq helm-split-window-in-side-p
      t)
