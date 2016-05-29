(defun myTerminal/set-up-package-lists ()
  (when (not package-archive-contents)
    (package-refresh-contents))

  (defvar myTerminal/basic-mode-packages
    '(multiple-cursors
      ace-jump-mode
      web-mode
      js2-mode
      ac-js2
      csharp-mode
      markdown-mode
      less-css-mode
      scss-mode
      sass-mode
      auto-complete
      autopair
      nlinum
      undo-tree
      ztree
      material-theme
      spacemacs-theme
      meta-presenter
      myterminal-controls
      theme-looper
      ))

  (defvar myTerminal/full-mode-packages
    '(helm
      smex
      powerline
      switch-window
      buffer-move
      haskell-mode
      latex-preview-pane
      column-enforce-mode
      rainbow-delimiters
      anzu
      command-log-mode
      minimap
      magit
      skewer-mode
      restclient
      mew
      jabber
      marmalade-client
      alpha))

  (mapc (lambda (p)
          (package-install p))
        (append myTerminal/basic-mode-packages
                myTerminal/full-mode-packages)))
