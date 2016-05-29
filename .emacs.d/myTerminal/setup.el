;Create repositories cache, if required
(when (not package-archive-contents)
  (package-refresh-contents))

;Declare a list of required packages
(defvar myTerminal/required-packages
  '(helm
    multiple-cursors
    ace-jump-mode
    smex
    powerline
    switch-window
    buffer-move
    web-mode
    js2-mode
    ac-js2
    csharp-mode
    markdown-mode
    less-css-mode
    sass-mode
    scss-mode
    haskell-mode
    latex-preview-pane
    auto-complete
    autopair
    column-enforce-mode
    rainbow-delimiters
    nlinum
    undo-tree
    anzu
    command-log-mode
    ztree
    minimap
    magit
    skewer-mode
    restclient
    mew
    jabber
    material-theme
    spacemacs-theme
    meta-presenter
    myterminal-controls
    theme-looper
    marmalade-client
    alpha))

;Install required packages
(mapc (lambda (p)
        (package-install p))
      myTerminal/required-packages)
