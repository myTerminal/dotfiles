;Disable menu-bar
(menu-bar-mode -1)

;Disable tool-bar
(tool-bar-mode -1)

;Disable scroll-bar
(scroll-bar-mode -1)

;Change cursor-type
(set-default 'cursor-type 
             'hbar)

;Disable 3D on mode line
(set-face-attribute 'mode-line nil :box nil)

;Set zoning preferences
(require 'zone)
(setq zone-programs 
      [zone-pgm-putz-with-case])
(defun myTerminal/set-zoning ()
  "Sets zoning timeout"
  (interactive)
  (zone-when-idle 20)
  (message "Zoning set"))

;Enable ido-mode
(ido-mode 1)

;Enable column-number mode
(column-number-mode)

;Enable show-paren-mode
(show-paren-mode)

;Disable highlighting on current line
(global-hl-line-mode -1)

;Enable winner-mode
(winner-mode t)

;Enable windmove
(windmove-default-keybindings)
