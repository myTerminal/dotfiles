# myTerminal's dotfiles

[![License: CC BY-NC-SA 4.0](https://licensebuttons.net/l/by-nc-sa/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

The 'replicable' heart of my computer(s)

## Platforms

- Linux
  - [Arch Linux](https://www.archlinux.org) (most complete)
  - [Fedora](https://getfedora.org) (almost complete)
  - [Debian](https://www.debian.org)/[Ubuntu](https://ubuntu.com) (far from complete)
- [macOS](https://www.apple.com/macos) (complete)

## Configuration

- [Git](https://git-scm.com)
- [Bash](https://www.gnu.org/software/bash) as the default shell
    - Frequently (and not-so-frequently) used aliases
    - System setup scripts for Fedora and macOS
    - A few other shell scripts
- [Fish](https://fishshell.com) as an alternate shell
    - All bash aliases re-defined for platform independence
- [Emacs](https://www.gnu.org/software/emacs) (now moved to a separate repository [.emacs.d](https://github.com/myTerminal/.emacs.d) and supports using more compatible configs like [super-emacs](https://github.com/myTerminal/super-emacs) and [ample-emacs](https://github.com/myTerminal/ample-emacs))
    - [mew](https://www.mew.org) as the email client
- [i3wm](https://i3wm.org) as a window manager on Fedora
- [Hyper](https://hyper.is) as a terminal on macOS
- [myterminal](https://github.com/myTerminal/myterminal) as a command-line companion
- [SDDM](https://github.com/sddm/sddm) (currently only the user avatar)

## Scripts

### Workstation setup scripts

To get the *dotfiles*, run the below commands in `~`:

    git init
    git remote add origin https://github.com/myTerminal/dotfiles.git
    git fetch --all
    rm .bash*
    git checkout master

To start setup, run the following command in a terminal running bash:

    . .setup/start

If you're running a shell different than bash, run something like:

    bash .setup/start

The setup scripts should take of the rest except for a couple of prompts for optional setup.

### Few utility scripts

There is a growing collection of shell utility scripts included to help one with daily command-line based tasks.

## To-Do

- Consume [twiner](https://github.com/myTerminal/twiner)
- Fill in missing sections for setups for the rest of the platforms
- Figure out alternatives for missing packages on all operating platforms
