(defvar myTerminal/basic-mode-key-bindings 
  '(("C-~" . myTerminal/set-zoning)
    ("C-!" . zone-leave-me-alone)
    ("C-c C-l" . nlinum-mode)
    ("C-}" . mc/mark-next-like-this)
    ("C-{" . mc/mark-previous-like-this)
    ("C-|" . mc/mark-all-like-this)
    ("C->" . ace-jump-mode)
    ("C-<" . ace-jump-mode-pop-mark)
    ("M-/" . undo-tree-visualize)
    ("C-\"" . theme-looper-enable-next-theme)
    ("C-M-'" . myterminal-controls-open-controls)
    ("M-<down>" . myTerminal/move-line-down)
    ("M-<up>" . myTerminal/move-line-up)
    ("C-=" . myTerminal/eval-and-replace)
    ("C-c c M-x" . execute-extended-command)
    ("C-S-<up>" . buf-move-up)
    ("C-S-<down>" . buf-move-down)
    ("C-S-<left>" . buf-move-left)
    ("C-S-<right>" . buf-move-right)
    ("<f5>" . myTerminal/reload-current-file)
    ("C-x C-/" . halal-mode)))

(defvar myTerminal/full-mode-key-bindings 
  '(("C-M-)" . transparency-increase)
    ("C-M-(" . transparency-decrease)
    ("C-c M-x" . smex)
    ("M-x" . helm-M-x)
    ("C-x b" . helm-mini)
    ("C-x C-b" . helm-buffers-list)
    ("C-x C-f" . helm-find-files)
    ("C-x C-r" . helm-recentf)
    ("M-y" . helm-show-kill-ring)
    ("C-M-z" . switch-window)
    ("C-x C-g" . myTerminal/dismiss-jabber-notification)))

(defun myTerminal/define-basic-mode-keyboard-bindings ()
  (mapc 'myTerminal/apply-keyboard-bindings
        myTerminal/basic-mode-key-bindings))
  
(defun myTerminal/define-full-mode-keyboard-bindings ()
  (mapc 'myTerminal/apply-keyboard-bindings
        myTerminal/full-mode-key-bindings))

(defun myTerminal/apply-keyboard-bindings (pair)
    "Apply keyboard-bindings for supplied list of key-pair values"
    (global-set-key (kbd (car pair))
                    (cdr pair)))
