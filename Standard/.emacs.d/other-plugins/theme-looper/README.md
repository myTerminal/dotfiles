# theme-looper.el

A color-theme looper for Emacs 24.

## Background
### (you can skip to Usage)

Emacs 24 comes with a set of pre-installed color-themes that can be enabled by a simple command like:

    M-x load-theme RET wombat
    
The above command enables (rather activates) 'wombat' theme. However, when you get lazy like I did, you need something like theme-looper.el. So, if you have a list of your favorite color-themes and you want to cycle thru them with simple key-strokes, you've come to the right place.

## Usage

Save the file 'theme-looper.el' to disk and add the directory containing it to 'load-path' using a command in your '.emacs' file like:

    (add-to-list 'load-path "~/.emacs.d/")
    
The above line assumes that you've placed the file into the Emacs directory '.emacs.d'.

Start the package with:

    (require 'theme-looper)

Optional: Set your list of favorite color themes:

    (theme-looper-set-theme-set (list 'deeper-blue 'tango-dark 'tsdh-dark 'wheatgrass))

Set up your key-bindings:

    (global-set-key (kbd "C-|") 'theme-looper-enable-next-theme)
    (global-set-key (kbd "C-\") 'theme-looper-enable-random-theme)

Optional: Set additional customization to be applied after every theme switch:

    (theme-looper-set-customizations 'my-func)

## Let me know
Let me know your suggestions on improving 'theme-looper.el' at ismail@teamfluxion.com

Thank you!
