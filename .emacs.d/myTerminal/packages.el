(defun myTerminal/configure-basic-mode-packages ()
  (ac-config-default)

  (add-hook 'js2-mode-hook 
            'ac-js2-mode)

  (setq inferior-js-program-command 
        "node --interactive")

  (global-undo-tree-mode)

  (autoload 'markdown-mode 
    "markdown-mode"
    "Major mode for editing Markdown files" t)

  (autoload 'ace-jump-mode 
    "ace-jump-mode" 
    "Emacs quick move minor mode"
    t)
  (autoload 'ace-jump-mode-pop-mark 
    "ace-jump-mode" 
    "Ace jump back:-"
    t)
    
  (add-hook 'dired-mode-hook
            'dired-launch-mode)

  (if (eq system-type
          'windows-nt)
      (setq projectile-indexing-method
            'alien))

  (theme-looper-set-theme-set '(gnome2
                                deep-blue
                                cobalt
                                railscast
                                spacemacs-dark
                                renegade))
  (theme-looper-set-customizations 'powerline-reset)

  (myterminal-controls-set-controls-data
   '(("t" "Change color theme" theme-looper-enable-next-theme)
     ("j" "Connect Jabber" jabber-connect-all)
     ("[" "Decrease transparency" transparency-decrease)
     ("]" "Increase transparency" transparency-increase)))

  (emacs-profiles-set-profiles-data (list '("0"
                                            "None"
                                            (lambda ()))
                                          '("1"
                                            "Home"
                                            myTerminal/activate-profile-home)
                                          '("2"
                                            "Office"
                                            myTerminal/activate-profile-office)))

  (add-to-list 'custom-theme-load-path
               "~/.emacs.d/other-plugins/replace-colorthemes"))

(defun myTerminal/configure-full-mode-packages ()
  (require 'alpha)
  
  (add-hook 'emacs-lisp-mode-hook 
            'column-enforce-mode)
  (add-hook 'js2-mode-hook
            'column-enforce-mode)

  (global-anzu-mode +1)

  (powerline-center-theme)
  (setq powerline-default-separator
        'slant)

  (add-hook 'haskell-mode-hook 
            'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 
            'inf-haskell-mode)
  (add-hook 'haskell-mode-hook 
            'turn-on-haskell-indentation)
  (add-to-list 'completion-ignored-extensions 
               ".hi")

  (which-key-mode)

  (helm-mode 1)
  (helm-autoresize-mode 1)
  (setq helm-split-window-in-side-p
        t)
  (helm-projectile-on))
