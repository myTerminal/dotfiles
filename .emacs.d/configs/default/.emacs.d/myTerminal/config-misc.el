(progn
  ;;User
  (setq user-full-name
        "Mohammed Ismail Ansari")
  (setq user-mail-address
        "team.terminal@gmail.com")

  ;;Backup
  (setq backup-inhibited
        t)
  (setq auto-save-default
        nil)

  ;;Startup
  (setq initial-buffer-choice
        t)
  (setq initial-scratch-message
        "Welcome myTerminal!\n\n")

  ;;Interface
  (setq frame-title-format "%b - emacs")
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-face-attribute 'mode-line nil :box nil)
  (display-battery-mode)

  ;;Text editing
  (column-number-mode)
  (electric-pair-mode)
  (show-paren-mode)
  (global-hl-line-mode -1)
  (setq-default indent-tabs-mode
                nil)
  (set-default 'cursor-type
               'hbar)
  (setq kill-whole-line
        t)
  (prefer-coding-system 'utf-8-unix)

  ;;Package archives and 'customize'
  (setq custom-file
        (concat mt/config-root
		"custom.el"))
  (require 'package)
  (setq package-user-dir
        (concat mt/config-root
		"elpa"))
  (setq package--init-file-ensured
        t)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/")
               t)
  (package-initialize)

  ;;Fira-Code font ligatures
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

  ;;Misc
  (winner-mode t)
  (windmove-default-keybindings)
  (require 'zone)
  (setq zone-programs
        [zone-pgm-quotes])
  (setq org-hide-leading-stars
        t)
  (setq org-todo-keywords
        '((sequence "DEFERRED(r)" "TODO(t)" "BLOCKED(b)" "IN-PROGRESS(p)" "|"
                    "ALMOST-THERE(a)" "DONE(d)" "CANCELLED(c)" "DELEGATED(g)"))))
