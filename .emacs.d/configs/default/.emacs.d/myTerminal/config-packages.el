(progn
  (when (not package-archive-contents)
    (package-refresh-contents))

  (defvar mt/packages
    '(;;Text-editing
      multiple-cursors
      auto-complete
      undo-tree
      sublimity
      rainbow-mode
      anzu
      ;;Navigation
      dumb-jump
      ace-jump-mode
      ace-window
      workgroups2
      buffer-move
      ibuffer-vc
      ;;Language modes
      web-mode
      js2-mode
      ac-js2
      less-css-mode
      scss-mode
      sass-mode
      vue-mode
      markdown-mode
      typescript-mode
      haskell-mode
      csharp-mode
      latex-preview-pane
      ;;Programming tools
      projectile
      diff-hl
      column-enforce-mode
      indent-guide
      magit
      minimap
      skewer-mode
      quickrun
      restclient
      ;;File-system
      ranger
      neotree
      ztree
      ;;Color themes
      material-theme
      hemisu-theme
      green-phosphor-theme
      overcast-theme
      ;;Super-powers
      which-key
      smex
      counsel
      counsel-projectile
      ivy-hydra
      ;;Visual tweaks
      telephone-line
      ;;Networking tools
      mew
      jabber
      ;;myTerminal's packages
      theme-looper
      meta-presenter
      myterminal-controls
      ;;Misc
      delight
      golden-ratio
      volume
      quelpa
      marmalade-client))

  (mapc (lambda (p)
          (unless (package-installed-p p)
            (package-install p)))
        mt/packages))

(progn
  (setq quelpa-update-melpa-p
        nil)

  (quelpa `(alpha :fetcher file
                  :path ,(concat mt/config-root
				"local-packages/alpha.el")))
  (quelpa '(prompt-you :fetcher github
                       :repo "myTerminal/prompt-you"))
  (quelpa '(emacs-visual-notifications :fetcher github
                                       :repo "myTerminal/emacs-visual-notifications"))
  (quelpa '(eagle-eye :fetcher github
                      :repo "myTerminal/eagle-eye"))
  (quelpa '(outer-spaces :fetcher github
                         :repo "myTerminal/outer-spaces"))
  (quelpa '(emacs-sounds :fetcher github
                         :repo "myTerminal/emacs-sounds"))
  (quelpa '(emacs-profiles :fetcher github
                           :repo "myTerminal/emacs-profiles"))
  (quelpa '(emacs-daily-events :fetcher github
                               :repo "myTerminal/emacs-daily-events"))
  (quelpa '(emacs-home :fetcher github
                       :repo "myTerminal/emacs-home"))
  (quelpa '(zone-quotes :fetcher github
                        :repo "myTerminal/zone-quotes"))
  (quelpa '(zone-tunnels :fetcher github
                         :repo "myTerminal/zone-tunnels"))
  (quelpa '(emacs-new-buffer :fetcher github
                             :repo "myTerminal/emacs-new-buffer"))
  (quelpa '(window-shaper :fetcher github
                          :repo "myTerminal/window-shaper"))
  (quelpa '(projectile-extras :fetcher github
                              :repo "myTerminal/projectile-extras")))

(progn
  (ac-config-default)

  (add-hook 'prog-mode-hook
            'display-line-numbers-mode)

  (add-hook 'prog-mode-hook
            'outer-spaces-mode)

  (add-hook 'js2-mode-hook
            'ac-js2-mode)

  (setq inferior-js-program-command
        "node --interactive")

  (global-undo-tree-mode)

  (require 'sublimity-scroll)

  (autoload 'markdown-mode
    "markdown-mode"
    "Major mode for editing Markdown files"
    t)

  (dumb-jump-mode)

  (autoload 'ace-jump-mode
    "ace-jump-mode"
    "Emacs quick move minor mode"
    t)
  (autoload 'ace-jump-mode-pop-mark
    "ace-jump-mode"
    "Ace jump back"
    t)

  (if (eq system-type
          'windows-nt)
      (setq projectile-indexing-method
            'alien))
  (setq projectile-switch-project-action
        (lambda ()
          (cond ((and (fboundp 'neo-global--window-exists-p)
                      (neo-global--window-exists-p))
                 (neotree-projectile-action))
                (t (counsel-projectile)))))
  (setq projectile-mode-line
        '(:eval (format " Project:%s"
                        (projectile-project-name))))
  (projectile-mode)
  (define-key projectile-mode-map
              (kbd "C-c C-p")
              'projectile-command-map)

  (setq ibuffer-formats
        '((mark
           " "
           read-only
           " "
           modified
           " "
           (name 18 18 :left :elide)
           " "
           (vc-status 16 16 :left)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " "
           filename-and-process)))

  (global-diff-hl-mode)

  (setq wg-prefix-key
        (kbd "M-z"))
  (setq wg-session-file
        (concat mt/config-root
		"workgroups2-session-file"))
  (setq wg-session-load-on-start
        nil)
  (workgroups-mode 1)
  (setq wg-emacs-exit-save-behavior
        'ask)
  (setq wg-workgroups-mode-exit-save-behavior
        'ask)
  (setq wg-mode-line-display-on
        t)

  (delight '((anzu-mode nil
                        anzu)
             (undo-tree-mode nil
                             undo-tree)
             (auto-complete-mode nil
                                 auto-complete)
             (which-key-mode nil
                             which-key)
             (workgroups-mode nil
                              workgroups2)
             (emacs-daily-events-global-mode " (!)"
                                             emacs-daily-events)
             (outer-spaces-mode " _a_"
                                outer-spaces)
             (eldoc-mode nil
                         eldoc)
             (buffer-face-mode nil
                               face-remap)
             (hi-lock-mode nil
                           hi-lock)))

  (theme-looper-set-favorite-themes '(overcast
                                      material
                                      green-phosphor
                                      hemisu-dark
                                      leuven))

  (myterminal-controls-set-controls-data
   '(("b" "Create temporary buffer"
      emacs-new-buffer-now
      t)
     ("." "Switch to next color-theme"
      theme-looper-enable-next-theme)
     ("," "Switch to previous color-theme"
      theme-looper-enable-previous-theme)
     ("[" "Decrease transparency"
      transparency-decrease)
     ("]" "Increase transparency"
      transparency-increase)))

  (global-anzu-mode +1)

  (telephone-line-mode t)
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

  (setq emacs-sounds-bell-sound
        (concat mt/config-root
                "sounds/bell.wav"))
  (setq emacs-sounds-find-file-sound
        (concat mt/config-root
                "sounds/file-change.wav"))
  (setq emacs-sounds-window-change-sound
        (concat mt/config-root
                "sounds/window-change.wav"))

  (emacs-daily-events-global-mode)
  (emacs-daily-events-set-events mt/workstation-variables/daily-events)

  (emacs-home-set-day-start-time mt/workstation-variables/day-start-time)
  (emacs-home-set-day-end-time mt/workstation-variables/day-end-time)
  (emacs-home-set-favorite-files mt/workstation-variables/favorite-files)
  (emacs-home-set-favorite-functions mt/workstation-variables/favorite-functions)

  (ivy-mode 1)
  (setq ivy-use-virtual-buffers
        t)
  (setq projectile-completion-system
        'ivy)
  (counsel-projectile-mode))

