# myTerminal's dotfiles

[![License: CC BY-NC-SA 4.0](https://licensebuttons.net/l/by-nc-sa/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

The 'replicable' heart of my computer(s)

## Platforms

- [Fedora](https://getfedora.org)
- [macOS](https://www.apple.com/macos)

## Configuration

- [Git](https://git-scm.com)
- [Bash](https://www.gnu.org/software/bash) as the default shell
    - Frequently (and not-so-frequently) used aliases
- [Fish](https://fishshell.com) as an alternate shell (still in progress)
- [Emacs](https://www.gnu.org/software/emacs)
    - [mew](https://www.mew.org) as the email client
- [i3wm](https://i3wm.org) as a window manager on Fedora
- [Hyper](https://hyper.is) as a terminal on macOS
- [myterminal](https://github.com/myTerminal/myterminal) as a command-line companion

## Scripts

### Workstation setup scripts

To start setup, run the following in `~` from a (bash) terminal

    git init
    git remote add origin https://github.com/myTerminal/dotfiles.git
    git fetch --all
    rm .bash*
    git checkout master
    ./.system/setup/run

### Few utility scripts

There is a growing collection of shell utility scripts included to help one with daily command-line based tasks.

## To-Do
- Add cloning of GitHub projects to setup
- Figure out alternatives for missing packages on either platforms
- Automate as many manual steps as possible
