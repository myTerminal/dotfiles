meta-presenter
==============

A simple experiment turned presenter for Emacs 24

## Usage

Save the file *meta-presenter.el* to disk and add the directory containing it to 'load-path' using a command in your '.emacs' file like:

    (add-to-list 'load-path "~/.emacs.d/")
    
The above line assumes that you've placed the file into the Emacs directory '.emacs.d'.

Start the package with:

    (require 'meta-presenter)

Create a directory that contains slides to be presented stored as files. Name the files as the slide number followed by an underscore, followed by the name of the slide. Below are some examples:

*   1_introduction.md
*   2_getting-started.md
*   3_advanced-features.md

Create a separate title slide for the presentation, start the presentation mode while viewing the file. For example, if the directory containing your slides contains a *title.md* file, you can run `mp:start-presentation` while having the file open in the buffer where you would like the presenation to start. When the presentation starts, you'll be taken to a buffer named *slide-show.md*.

In order to move to the next slide, run `mp:move-to-next-slide`. Moving back to the previous slide is obviously `mp:move-to-previous-slide`.

Keys *F5*, *F8* and *F7* have already been assigned to the three functions mentioned above, respectively.

## Let me know
Let me know your suggestions on improving 'meta-presenter.el' at ismail@teamfluxion.com

Thank you!
