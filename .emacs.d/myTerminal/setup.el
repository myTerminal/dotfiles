(defun myTerminal/set-up-package-lists ()
  (when (not package-archive-contents)
    (package-refresh-contents))

  (defvar myTerminal/packages
    '(;Text-editing
      (multiple-cursors nil)
      (auto-complete nil)
      (ace-jump-mode nil)
      (nlinum nil)
      (undo-tree nil)
      ;Navigation
      (workgroups2 nil)
      ;Language modes
      (web-mode nil)
      (js2-mode nil)
      (ac-js2 nil)
      (less-css-mode nil)
      (scss-mode nil)
      (sass-mode nil)
      (markdown-mode nil)
      (csharp-mode nil)
      ;Programming tools
      (projectile nil)
      ;File-system
      (ranger nil)
      (neotree nil)
      (ztree nil)
      ;Color themes
      (material-theme nil)
      ;myTerminal's packages
      (theme-looper nil)
      (meta-presenter nil)
      (myterminal-controls nil)
      (emacs-profiles nil)
      (outer-spaces nil)
      ;
      ;Full-mode packages
      ;
      ;Text-editing
      (anzu t)
      ;Navigation
      (switch-window t)
      (buffer-move t)
      ;Language modes
      (haskell-mode t)
      (latex-preview-pane t)
      (column-enforce-mode t)
      (minimap t)
      (indent-guide t)
      ;Programming tools
      (magit t)
      (skewer-mode t)
      (restclient t)
      ;Super powers
      (which-key t)
      (smex t)
      (helm t)
      (helm-projectile t)
      ;Visual tweaks
      (telephone-line t)
      ;Networking tools
      (mew t)
      (jabber t)
      ;Misc
      (marmalade-client t)
      (alpha t)))

  (mapc (lambda (p)
          (package-install (car p)))
        myTerminal/packages))
