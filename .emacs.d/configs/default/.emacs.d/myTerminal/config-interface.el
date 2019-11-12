(progn
  (setq frame-title-format "%b - emacs")

  (menu-bar-mode -1)

  (tool-bar-mode -1)

  (scroll-bar-mode -1)

  (set-default 'cursor-type
               'hbar)

  (set-face-attribute 'mode-line nil :box nil)

  ;; Setup Fira Code ligatures
  (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
                 (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
                 (36 . ".\\(?:>\\)")
                 (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
                 (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
                 (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
                 (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
                 (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                 (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
                 (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
                 (48 . ".\\(?:x[a-zA-Z]\\)")
                 (58 . ".\\(?:::\\|[:=]\\)")
                 (59 . ".\\(?:;;\\|;\\)")
                 (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
                 (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
                 (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
                 (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
                 (91 . ".\\(?:]\\)")
                 (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
                 (94 . ".\\(?:=\\)")
                 (119 . ".\\(?:ww\\)")
                 (123 . ".\\(?:-\\)")
                 (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
                 (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)"))))
    (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
                            `([,(cdr char-regexp) 0 font-shape-gstring]))))

  (require 'zone)
  (setq zone-programs
        [zone-pgm-quotes])
  (defun mt/interface/set-zoning ()
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
