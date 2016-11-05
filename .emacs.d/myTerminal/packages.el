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
    
  (if (eq system-type
          'windows-nt)
      (setq projectile-indexing-method
            'alien))

  (setq wg-prefix-key
        (kbd "M-z"))
  (setq wg-session-file
        "~/.emacs.d/.workgroups2-session-file")
  (setq wg-session-load-on-start
        nil)
  (workgroups-mode 1)
  (setq wg-emacs-exit-save-behavior
        'ask)
  (setq wg-workgroups-mode-exit-save-behavior
        'ask)
  (setq wg-mode-line-display-on
        t)

  (theme-looper-set-theme-set '(gnome2
                                deep-blue
                                cobalt
                                railscast
                                spacemacs-dark
                                renegade))

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

  (telephone-line-mode t)
  (telephone-line-defsegment telephone-line-workgroups2-segment
    (wg-mode-line-string))
  (setq telephone-line-lhs
        '((evil   . (telephone-line-misc-info-segment))
          (accent . (telephone-line-buffer-segment
                     telephone-line-workgroups2-segment))
          (nil    . (telephone-line-minor-mode-segment))))
  (setq telephone-line-rhs
        '((nil    . (telephone-line-process-segment
                     telephone-line-vc-segment
                     telephone-line-erc-modified-channels-segment))
          (accent . (telephone-line-major-mode-segment))
          (evil   . (telephone-line-airline-position-segment))))
  (setq telephone-line-primary-left-separator
        telephone-line-gradient)
  (setq telephone-line-primary-right-separator
        telephone-line-gradient)
  (telephone-line-mode t)

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
