(defun myTerminal/interface/configure-interface ()
  (setq frame-title-format "emacs")

  (menu-bar-mode -1)

  (tool-bar-mode -1)

  (scroll-bar-mode -1)

  (set-default 'cursor-type
               'hbar)

  (set-face-attribute 'mode-line nil :box nil)

  (cond ((not (eq system-type
                  'darwin))
         (custom-set-faces
          '(default ((t (:family "Liberation Mono")))))))

  (require 'zone)
  (setq zone-programs
        [zone-pgm-quotes])
  (defun myTerminal/interface/set-zoning ()
    "Sets zoning timeout"
    (interactive)
    (zone-when-idle 60)
    (message "Zoning set"))

  (column-number-mode)

  (display-battery-mode)

  (electric-pair-mode)

  (show-paren-mode)

  (global-hl-line-mode -1)

  (winner-mode t)

  (windmove-default-keybindings)

  (setq org-hide-leading-stars
        t)
  (setq org-todo-keywords
        '((sequence "DEFERRED(r)" "TODO(t)" "BLOCKED(b)" "IN-PROGRESS(p)" "|"
                    "ALMOST-THERE(a)" "DONE(d)" "CANCELLED(c)" "DELEGATED(g)"))))
