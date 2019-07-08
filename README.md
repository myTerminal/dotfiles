# myTerminal's dotfiles

[![License: CC BY-NC-SA 4.0](https://licensebuttons.net/l/by-nc-sa/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

Built for [Fedora](https://getfedora.org) and [macOs](https://www.apple.com/macos)

## Contents

### Configuration

- [Git](https://git-scm.com) as a source-control system
- [Bash](https://www.gnu.org/software/bash) as a shell
    - Frequently (and not-so-frequently) used aliases
- [Fish](https://fishshell.com) as another shell (still incomplete)
- [Emacs](https://www.gnu.org/software/emacs) as almost the only text-editor
    - [mew](https://www.mew.org) as the email client
- [i3wm](https://i3wm.org) window manager on Fedora
- [Hyper](https://hyper.is) terminal on macOs
- [myTerminal](https://github.com/myTerminal/myterminal) as a command-line companion

### Scripts

#### Workstation setup scripts

To start setup, run the following in `~` from a (bash) terminal

    git init
    git remote add origin https://github.com/myTerminal/dotfiles.git
    git fetch --all
    rm .bash*
    git checkout master
    ./.system/setup/run

#### Few utility scripts

There is a growing collection of shell utility scripts included to help one with daily command-line based tasks.
