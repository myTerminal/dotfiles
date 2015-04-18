# myTerminal-controls

Quick toggle controls at a key-stroke.

You can use myTerminal-controls to save a lot of key-bindings by grouping them into a single controls window. The controls window can be opened with a key-binding and the rest key-bindings are displayed within the controls window.

## Usage

Save the file *myTerminal-controls.el* to disk and add the directory containing it to `load-path` using a command in your *.emacs* file like:

    (add-to-list 'load-path "~/.emacs.d/")

The above line assumes that you've placed the file into the Emacs directory '.emacs.d'.

Start the package with:

    (require 'myTerminal-controls)

Set a key-binding to open the quick-toggle controls window anytime

    (global-set-key (kbd "C-M-`") 'myTerminal-controls:open-controls)

You can also set your custom list of quick-toggle controls

    (myTerminal-controls:set-controls-data
        (list '("1" "Invert colors" (lambda ()
                                        (invert-face 'default)))
              '("2" "Invert mode-line" (lambda ()
                                           (invert-face 'mode-line)))))

Each item in the list should contain three elements:

* Key combination information
* Text to be displayed in the controls window
* Function to be executed against the key combination

## Let me know

Let me know your suggestions on improving *myTerminal-controls* at ismail@teamfluxion.com

Thank you!
