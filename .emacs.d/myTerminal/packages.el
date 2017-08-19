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
      (ibuffer-vc nil)
      ;Language modes
      (web-mode nil)
      (js2-mode nil)
      (ac-js2 nil)
      (less-css-mode nil)
      (scss-mode nil)
      (sass-mode nil)
      (markdown-mode nil)
      (typescript-mode nil)
      (csharp-mode nil)
      ;Programming tools
      (projectile nil)
      (diff-hl nil)
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
      ;Misc
      (volume nil)
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
      ;Programming tools
      (column-enforce-mode t)
      (minimap t)
      (indent-guide t)
      (magit t)
      (skewer-mode t)
      (restclient t)
      ;Super powers
      (which-key t)
      (smex t)
      (counsel t)
      (counsel-projectile t)
      (ivy-hydra t)
      ;Visual tweaks
      (telephone-line t)
      ;Networking tools
      (mew t)
      (jabber t)
      ;Misc
      (marmalade-client t)))

  (mapc (lambda (p)
          (unless (package-installed-p (car p))
            (package-install (car p))))
        myTerminal/packages))

(defun myTerminal/load-local-packages ()
  (add-to-list
   'load-path "~/.emacs.d/local-packages/")

  (require 'alpha)
  (require 'prompt-you)
  (require 'emacs-profiles)
  (require 'outer-spaces)
  (require 'emacs-sounds)
  (require 'emacs-home))

(defun myTerminal/configure-basic-mode-packages ()
  (ac-config-default)

  (add-hook 'prog-mode-hook
            'nlinum-mode)

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
  (projectile-mode)

  (defun projectile-find-all-occurrences (&optional arg)
    "List all occurrences of the text being searched using completion.
With a prefix argument ARG prompts you for a directory on which to run search in."
    (interactive "P")
    (let* ((text-to-search (read-string
                            (projectile-prepend-project-name "Find all: ")
                            (projectile-symbol-or-selection-at-point)))
           (directory (if arg
                          (file-name-as-directory
                           (read-directory-name "Find in directory: "))
                        (projectile-project-root)))
           (file-to-search (projectile-files-with-string text-to-search directory)))
      (projectile-completing-read
       "All occurrences: "
       (reduce #'append
               (mapcar (lambda (file)
                         (with-temp-buffer
                           (insert-file-contents file)
                           (let ((lines (split-string (buffer-string) "\n")))
                             (cl-remove-if nil
                                           (mapcar (lambda (line)
                                                     (let ((present-in-linep (search text-to-search line)))
                                                       (cond (present-in-linep (concat (cadr (split-string file (projectile-project-root)))
                                                                                       " => line "
                                                                                       (number-to-string (1+ (cl-position line lines)))))
                                                             (t nil))))
                                                   lines)))))
                       file-to-search))
       :action `(lambda (item)
                  (let ((file (car (split-string item " => line ")))
                        (line-number (string-to-number (cadr (split-string item " => line ")))))
                    (find-file (expand-file-name file ,(projectile-project-root)))
                    (beginning-of-buffer)
                    (forward-line (1- line-number))
                    (search-forward text-to-search)
                    (set-mark-command nil)
                    (search-backward text-to-search)
                    (run-hooks 'projectile-find-file-hook))))))

  (defun projectile-find-all-references (&optional arg)
    "List all references of the symbol under cursor using completion.
With a prefix argument ARG prompts you for a directory on which to run search in."
    (interactive "P")
    (let* ((text-to-search (cond ((use-region-p) (buffer-substring-no-properties (region-beginning) (region-end)))
                                 (t (thing-at-point 'symbol))))
           (directory (if arg
                          (file-name-as-directory
                           (read-directory-name "Find in directory: "))
                        (projectile-project-root)))
           (file-to-search (projectile-files-with-string text-to-search directory)))
      (projectile-completing-read
       "All references: "
       (reduce #'append
               (mapcar (lambda (file)
                         (with-temp-buffer
                           (insert-file-contents file)
                           (let ((lines (split-string (buffer-string) "\n")))
                             (cl-remove-if nil
                                           (mapcar (lambda (line)
                                                     (let ((present-in-linep (search text-to-search line)))
                                                       (cond (present-in-linep (concat (cadr (split-string file (projectile-project-root)))
                                                                                       " => line "
                                                                                       (number-to-string (1+ (cl-position line lines)))))
                                                             (t nil))))
                                                   lines)))))
                       file-to-search))
       :action `(lambda (item)
                  (let ((file (car (split-string item " => line ")))
                        (line-number (string-to-number (cadr (split-string item " => line ")))))
                    (find-file (expand-file-name file ,(projectile-project-root)))
                    (beginning-of-buffer)
                    (forward-line (1- line-number))
                    (search-forward text-to-search)
                    (set-mark-command nil)
                    (search-backward text-to-search)
                    (run-hooks 'projectile-find-file-hook))))))

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

  (theme-looper-set-theme-set '(material
                                cobalt
                                railscast
                                subtle-hacker
                                leuven))

  (myterminal-controls-set-controls-data
   '(("t" "Change color theme" theme-looper-enable-next-theme)
     ("j" "Connect Jabber" jabber-connect-all)
     ("[" "Decrease transparency" transparency-decrease)
     ("]" "Increase transparency" transparency-increase)))

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
        "/home/ismail/.emacs.d/sounds/bell.wav")
  (setq emacs-sounds-find-file-sound
        "/home/ismail/.emacs.d/sounds/file-change.wav")
  (setq emacs-sounds-window-change-sound
        "/home/ismail/.emacs.d/sounds/window-change.wav")

  (emacs-home-set-day-start-time myTerminal/local-configs/day-start-time)
  (emacs-home-set-day-end-time myTerminal/local-configs/day-end-time)
  (emacs-home-set-pinned-files myTerminal/local-configs/favorite-files)
  (emacs-home-set-pinned-functions myTerminal/local-configs/favorite-functions)

  (ivy-mode 1)
  (setq ivy-use-virtual-buffers
        t)
  (setq projectile-completion-system
        'ivy)
  (counsel-projectile-on))

