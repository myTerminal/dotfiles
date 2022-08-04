(
 (:void :arch :debian :mac)
 (
  ("archlinux-keyring" (:void) (:debian) (:mac))
  ("cryptsetup" (:mac))
  "cryfs"
  ("efibootmgr" (:mac))
  ("polkit" (:debian) (:mac))
  ("dbus" (:arch) (:debian) (:mac))
  "tmux"
  ("fish" (:xbps "fish-shell"))
  ("fd" (:apt "fd-find"))
  ("lsd" (:apt "exa"))
  "bat"
  "ncdu"
  "ripgrep"
  "fzf"
  ("vim" (:mac))
  ("emacs" (:xbps "emacs-gtk3") (:cask "emacs"))
  ("mpv")
  "aspell"
  ("aspell-en" (:mac))
  "git"
  "tig"
  "make"
  "ranger"
  "rsync"
  ("diffmerge" (:void) (:arch) (:debian) (:cask "diffmerge"))
  ("zip" (:mac))
  ("unzip" (:mac))
  "htop"
  ("psmisc" (:mac))
  ("udisks2" (:cask "mounty"))
  ("network-manager" (:xbps "NetworkManager") (:pacman "networkmanager") (:mac))
  ("bind-utils" (:pacman "bind") (:apt "dnsutils") (:mac))
  "weechat"
  ("docker" (:brew "docker" "docker-machine"))
  ("nodejs" (:pacman "npm") (:apt "npm") (:brew "node"))
  "sbcl"
  ("rustup" (:apt "cargo") (:brew "rustup-init"))
  ("brightnessctl" (:mac))
  ("acpi" (:mac))
  ("numlockx" (:paru "systemd-numlockontty") (:mac))
  ("chrony" (:arch) (:mac))
  ("btrfs-progs" (:mac))
  ("ntfs-3g" (:mac))
  ("mtools" (:mac))
  ("dosfstools" (:mac))
  "rlwrap"
  "neofetch"
  "wget"
  "curl"
  ("openssh" (:apt "ssh") (:mac))
  ("xorg" (:xbps "xorg-server") (:mac))
  ("sct" (:paru "sct") (:mac))
  ("onboard" (:mac))
  ("picom" (:apt "compton") (:mac))
  ("i3" (:xbps "i3" "i3status" "i3lock") (:mac))
  ("xfce4" (:mac))
  ("feh" (:mac))
  ("dmenu" (:debian) (:mac))
  ("rofi" (:mac))
  ("kitty" (:cask "alacritty"))
  ("xsel" (:mac))
  ("udiskie" (:mac))
  ("gparted" (:mac))
  ("thunar" (:xbps "Thunar") (:mac))
  ("gvfs" (:mac))
  ("syncthing" (:xbps "syncthing-gtk") (:paru "syncthing-gtk") (:apt "syncthing-gtk"))
  ("brave" (:void) (:debian) (:cask "brave-browser"))
  ("keepassxc" (:cask "keepasxc"))
  ("authy" (:void) (:paru "authy") (:debian) (:cask "authy"))
  ("tunnelbear" (:void) (:paru "tunnelbear") (:debian) (:cask "tunnelbear"))
  ("thunderbird" (:mac))
  ("discord" (:flatpak ("com.discordapp.Discord" "discord")) (:paru "discord") (:cask "discord"))
  ("element" (:flatpak ("im.riot.Riot" "element")) (:paru "element-desktop") (:cask "element"))
  ("pcloud" (:void) (:paru "pcloud-drive") (:debian) (:mac))
  ("google-backup-and-sync" (:void) (:arch) (:debian) (:cask "google-backup-and-sync"))
  ("transmission" (:xbps "transmission-gtk") (:pacman "transmission-gtk") (:cask "transmission"))
  ("postman" (:void) (:paru "postman-bin") (:flatpak ("com.getpostman.Postman" "postman")) (:cask "postman"))
  ("nomachine" (:void) (:paru "nomachine") (:debian) (:cask "nomachine"))
  ("virt-manager" (:xbps "qemu" "virt-manager"))
  ("libreoffice" (:pacman "libreoffice-fresh") (:cask "libreoffice"))
  ("blueman" (:mac))
  ("shotwell" (:cask "xnviewmp"))
  ("gimp" (:cask "gimp"))
  ("darktable" (:cask "darktable"))
  ("clementine" (:cask "clementine"))
  ("pavucontrol" (:mac))
  ("gstreamer" (:xbps "gstreamer1") (:debian) (:mac))
  ("pulseaudio" (:pacman "pulseaudio" "pulseaudio-bluetooth") (:mac))
  ("pulseeffects-legacy" (:paru "pulseeffects-legacy") (:apt "pulseeffects") (:mac))
  ("audacity" (:mac))
  ("easytag" (:cask "kid3"))
  ("vlc" (:cask "vlc"))
  ("handbrake" (:cask "handbrake"))
  ("blender" (:cask "blender"))
  "youtube-dl"
  ("yt-dlp" (:void) (:arch) (:debian) (:mac))
  ("kodi" (:cask "kodi"))
  ("flameshot" (:mac))
  ("obs" (:pacman "obs-studio") (:apt "obs-studio") (:cask "obs"))
  ("peek" (:cask "licecap"))
  ("keymon" (:void) (:paru "key-mon") (:debian) (:cask "keycastr"))
  ("balena-etcher" (:void) (:paru "balena-etcher") (:debian) (:cask "balenaetcher"))
  ("steam" (:flatpak ("com.valvesoftware.Steam" "steam")) (:pacman "steam") (:apt "steam") (:cask "steam"))
  ("origin" (:void) (:arch) (:debian) (:cask "origin"))
  ("gamehub" (:paru "gamehub") (:debian) (:mac))
  ("android-tools" (:apt "android-platform-system-core") (:cask "android-platform-tools"))
  ("sony-remote-play" (:void) (:arch) (:debian) (:cask "sony-ps4-remote-play"))
  ("barrier" (:cask "barrier"))
  ("rememberthemilk" (:void) (:paru "rememberthemilk") (:debian) (:cask "remember-the-milk"))
  ("dynalist" (:void) (:paru "dynalist-desktop") (:debian) (:cask "dynalist"))
  ("edex-ui" (:void) (:paru "edex-ui") (:debian) (:cask "edex-ui"))
  ("razer-synapse" (:void) (:arch) (:debian) (:cask "razer-synapse"))
  ("font-open-sans" (:void) (:arch) (:debian) (:cask "font-open-sans"))
  ("font-inconsolata" (:void) (:arch) (:debian) (:cask "font-inconsolata"))
  ("font-liberation" (:void) (:arch) (:debian) (:cask "font-liberation"))
  ("font-roboto-mono" (:void) (:arch) (:debian) (:cask "font-roboto-mono"))
  ("font-fira-code" (:void) (:arch) (:debian) (:cask "font-fira-code"))
  )
 (
  "Install flatpak packages the conventional way"
  nil
  (:void ("~/.scripts/linux/mt-flatpak-install postman com.getpostman.Postman"
          "~/.scripts/linux/mt-flatpak-install discord com.discordapp.Discord"
          "~/.scripts/linux/mt-flatpak-install element im.riot.Riot"))
  (:debian ("~/.scripts/linux/mt-flatpak-install postman com.getpostman.Postman"
            "~/.scripts/linux/mt-flatpak-install discord com.discordapp.Discord"
            "~/.scripts/linux/mt-flatpak-install element im.riot.Riot"))
  )
 (
  "Enable hidden items in Finder"
  nil
  (:mac ("defaults write com.apple.Finder AppleShowAllFiles YES"
         "killall Finder"))
  )
 (
  "Perform a few package-dependent config"
  nil
  (:void ("sudo usermod -aG libvirt ismail"))
  (:arch ("sudo usermod -aG libvirt ismail"))
  (:debian ("sudo usermod -aG libvirt ismail"
            "sudo ln -s \"$(which fdfind)\" \"$(which fdfind | xargs readlink -f | xargs dirname)/fd\""
            "sudo ln -s \"$(which batcat)\" \"$(which batcat | xargs readlink -f | xargs dirname)/bat\""))
  )
 (
  "Set up Docker"
  t
  (:void ("sudo groupadd docker"
          "sudo gpasswd -a ${USER} docker"
          "sudo ln -s /etc/sv/docker /var/service"))
  (:arch ("sudo groupadd docker"
          "sudo gpasswd -a ${USER} docker"
          "sudo systemctl enable docker"))
  (:debian ("sudo groupadd docker"
            "sudo gpasswd -a ${USER} docker"
            "sudo systemctl enable docker"))
  (:mac ("docker-machine create --driver virtualbox default"
         "eval ${docker-machine env default}"))
  )
 (
  "Change user shell"
  t
  (:void ("sudo usermod -s /bin/fish ismail"))
  (:arch ("sudo usermod -s /bin/fish ismail"))
  (:debian ("sudo usermod -s /bin/fish ismail"))
  (:mac ("echo \"/usr/local/bin/fish\" | sudo tee -a /etc/shells"
         "chsh -s /usr/local/bin/fish"))
  )
 (
  "Install Rust Toolchain"
  t
  (:void ("rustup-init --default-toolchain stable --profile default -y"))
  (:arch ("rustup toolchain install stable"))
  (:debian ("rustup toolchain install stable"))
  (:mac ("rustup-init"))
  )
 (
  "Install Graphical Theming: GTK theme"
  t
  (:all ("mkdir -p ~/.local/share/themes"
         "git clone https://github.com/WernerFP/Shades-of-gray-theme.git ~/_temp"
         "mv ~/_temp/Shades-of* ~/.local/share/themes/"
         "rm -rf ~/_temp"))
  )
 (
  "Install Graphical Theming: Icon theme"
  t
  (:all ("mkdir -p ~/.local/share/icons"
         "git clone https://github.com/madmaxms/iconpack-obsidian ~/_temp"
         "mv ~/_temp/Obsidian* ~/.local/share/icons/"
         "rm -rf ~/_temp"))
  )
 (
  "Install Graphical Theming: Cursor theme"
  t
  (:all ("mkdir -p ~/.local/share/icons"
         "mkdir ~/_temp"
         "cd ~/_temp"
         "wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v1.1.1/Bibata.tar.gz"
         "tar -xvf Bibata.tar.gz"
         "mv ~/_temp/Bibata-*  ~/.local/share/icons"
         "cd ~/"
         "rm -rf ~/_temp"))
  )
 (
  "Install Fonts"
  t
  (:all ("mkdir -p ~/.local/share/fonts"
         "git clone https://github.com/FortAwesome/Font-Awesome ~/_temp"
         "mv ~/_temp/otfs ~/.local/share/fonts/FontAwesome"
         "rm -rf ~/_temp"
         "mkdir -p ~/.local/share/fonts"
         "git clone https://github.com/googlefonts/opensans ~/_temp"
         "mv ~/_temp/fonts/ttf ~/.local/share/fonts/OpenSans"
         "rm -rf ~/_temp"
         "mkdir -p ~/.local/share/fonts"
         "git clone https://github.com/googlefonts/inconsolata ~/_temp"
         "mv ~/_temp/fonts/ttf ~/.local/share/fonts/Inconsolata"
         "rm -rf ~/_temp"
         "mkdir -p ~/.local/share/fonts"
         "git clone https://github.com/googlefonts/RobotoMono ~/_temp"
         "mv ~/_temp/fonts/ttf ~/.local/share/fonts/RobotoMono"
         "rm -rf ~/_temp"
         "mkdir -p ~/.local/share/fonts"
         "git clone https://github.com/grays/droid-fonts ~/_temp"
         "mv ~/_temp/droid ~/.local/share/fonts/Droid"
         "rm -rf ~/_temp"
         "mkdir -p ~/.local/share/fonts"
         "git clone https://github.com/tonsky/FiraCode ~/_temp"
         "mv ~/_temp/distr/ttf ~/.local/share/fonts/FiraCode"
         "rm -rf ~/_temp"
         "mkdir -p ~/.local/share/fonts"
         "mkdir ~/_temp"
         "cd ~/_temp"
         "wget https://github.com/liberationfonts/liberation-fonts/files/6418984/liberation-fonts-ttf-2.1.4.tar.gz"
         "tar -xvf liberation-fonts-ttf-2.1.4.tar.gz"
         "mkdir ~/.local/share/fonts/Liberation"
         "mv ~/_temp/liberation-fonts-ttf-2.1.4/Liberation*  ~/.local/share/fonts/Liberation/"
         "cd ~/"
         "rm -rf ~/_temp"))
  )
 (
  "Set up peripheral drivers"
  t
  (:void ("sudo xbps-install -Sy razergenie openrazer-meta"
          "sudo gpasswd -a $USER plugdev"))
  (:arch ("paru -S python-notify2 openrazer-meta polychromatic --noconfirm"
          "sudo pacman -Syu linux-headers --noconfirm"
          "sudo gpasswd -a $USER plugdev"))
  (:debian ("echo 'deb http://download.opensuse.org/repositories/hardware:/razer/Debian_Testing/ /' | sudo tee /etc/apt/sources.list.d/hardware:razer.list"
            "curl -fsSL https://download.opensuse.org/repositories/hardware:razer/Debian_Testing/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/hardware_razer.gpg > /dev/null"
            "sudo apt update"
            "sudo apt install -y openrazer-meta razergenie"
            "sudo gpasswd -a $USER plugdev"))
  )
 (
  "Set up startup services"
  t
  (:void ("sudo ln -s /etc/sv/libvirtd /var/service"
          "sudo ln -s /etc/sv/virtlogd /var/service"
          "sudo ln -s /etc/sv/bluetoothd /var/service"
          "sudo ln -s /etc/sv/sshd /var/service"))
  (:arch ("systemctl enable numLockOnTty.service"
          "systemctl start numLockOnTty.service"
          "systemctl --user enable syncthing.service"
          "systemctl --user start syncthing.service"
          "systemctl enable bluetooth"
          "systemctl start bluetooth"
          "systemctl enable ssh"
          "systemctl start ssh"))
  (:debian ("systemctl --user enable syncthing.service"
            "systemctl --user start syncthing.service"
            "systemctl enable bluetooth"
            "systemctl start bluetooth"
            "systemctl enable ssh"
            "systemctl start ssh"))
  (:mac ("brew services start syncthing"))
  )
 (
  "Perform visual tweaks"
  t
  (:all ("wget -O - https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh | bash"))
  )
 (
  "Enable touch scrolling for Firefox"
  t
  (:all ("echo \"
MOZ_USE_XINPUT2 DEFAULT=1
\" | sudo tee -a /etc/security/pam_env.conf"))
  )
 (
  "Install global NPM packages"
  t
  (:all ("sudo npm install -g lite-server nano-server myterminal-cli stay-with-me git-getter re-write"))
  )
 (
  "Create custom Lisp parser"
  t
  (:all ("sudo cp /home/ismail/.assets/cl /usr/bin/cl"))
  )
 (
  "Create required directories"
  t
  (:all ("mkdir ~/_workspace"
         "mkdir ~/_workspace/github"
         "mkdir ~/_store"))
  )
 (
  "Clone public GitHub source projects for myTerminal"
  t
  (:all ("git-getter --username myTerminal --targetPath ~/_workspace/github --ssh"))
  )
 (
  "Create fallback link to .emacs.d"
  t
  (:all ("ln -s /home/ismail/.config/emacs /home/ismail/.emacs.d"))
  )
 (
  "Link myTerminal/.emacs.d to myterminal/dotfiles"
  t
  (:all ("mkdir /home/ismail/.config/emacs/configs"
         "ln -s ~/_workspace/github/.emacs.d/emacs ~/.config/emacs/configs/_default"))
  )
 (
  "Convert dotfiles at '~' from HTTPS to SSH"
  t
  (:all ("rm -rf ~/.git"
         "cp -r ~/_workspace/github/dotfiles/.git ~/.git"))
  )
 (
  "Create convenience soft-links"
  t
  (:all ("ln -s ~/_workspace/kitchen ~/_kitchen"
         "ln -s ~/_workspace/github ~/_github"
         "ln -s ~/_workspace/github/myTerminal.github.io ~/_portfolio-data"
         "ln -s ~/_workspace/all/myterminal-web-lp ~/_portfolio-lp"
         "ln -s ~/_store/Documents ~/_documents"
         "ln -s ~/_store/Documents/notes ~/_notes"
         "ln -s ~/_store/Mobile-Media ~/_mobile-media"
         "ln -s ~/_store/YouTube ~/_youtube"))
  )
 (
  "Re-generate symlinks for binaries"
  t
  (:all ("~/.setup/regenerate-binary-symlinks"))
  )
 (
  "Tag machine with ~/.mt-tag"
  t
  (:all ("touch ~/.mt-tag"))
  )
 )
