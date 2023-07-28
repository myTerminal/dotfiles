(
 (:void :mac)
 (
  ("cryptsetup" (:mac))
  "cryfs"
  ("polkit" (:mac))
  ("dbus" (:mac))
  ("efibootmgr" (:mac))
  "tmux"
  ("fish" (:xbps "fish-shell"))
  "fd"
  "lsd"
  "bat"
  "ncdu"
  "ripgrep"
  "fzf"
  ("vim" (:mac))
  ("emacs" (:xbps "emacs-gtk3") (:cask "emacs"))
  "mpv"
  ("aspell" (:xbps "aspell" "aspell-en") (:mac))
  "make"
  "git"
  "tig"
  "ranger"
  "rsync"
  ("zip" (:mac))
  ("unzip" (:mac))
  "btop"
  ("psmisc" (:mac))
  ("udisks2" (:cask "mounty"))
  ("network-manager" (:xbps "NetworkManager") (:mac))
  ("bind-utils" (:mac))
  "weechat"
  ("docker" (:brew "docker" "docker-machine"))
  ("nodejs" (:brew "node"))
  "sbcl"
  ("rustup" (:brew "rustup-init"))
  ("brightnessctl" (:mac))
  ("acpi" (:mac))
  ("numlockx" (:mac))
  ("chrony" (:mac))
  ("btrfs-progs" (:mac))
  ("ntfs-3g" (:mac))
  ("dosfstools" (:mac))
  ("mtools" (:mac))
  ("exfat-utils" (:mac))
  ("android-tools" (:cask "android-platform-tools"))
  "rlwrap"
  "neofetch"
  "wget"
  "curl"
  "avahi"
  ("openssh" (:mac))
  ("xorg" (:mac))
  ("xdg-utils" (:mac))
  ("sct" (:mac))
  ("onboard" (:mac))
  ("picom" (:mac))
  ("i3" (:xbps "i3" "i3status" "i3lock") (:mac))
  ("xss-lock" (:mac))
  ("xfce4" (:mac))
  ("edex-ui" (:void) (:cask "edex-ui"))
  ("feh" (:mac))
  ("dmenu" (:mac))
  ("rofi" (:mac))
  ("kitty" (:cask "alacritty"))
  ("xsel" (:mac))
  ("udiskie" (:mac))
  ("gparted" (:mac))
  ("thunar" (:xbps "Thunar") (:mac))
  ("gvfs" (:mac))
  ("syncthing" (:xbps "syncthing-gtk"))
  ("brave" (:void) (:cask "brave-browser"))
  ("rememberthemilk" (:void) (:cask "remember-the-milk"))
  ("dynalist" (:void) (:cask "dynalist"))
  ("keepassxc" (:cask "keepasxc"))
  ("authy" (:void) (:cask "authy"))
  ("tunnelbear" (:void) (:cask "tunnelbear"))
  ("thunderbird" (:mac))
  ("schildi" (:flatpak ("chat.schildi.desktop" "schildi")) (:cask "schildichat"))
  ("google-backup-and-sync" (:void) (:cask "google-backup-and-sync"))
  ("pcloud" (:void) (:mac))
  ("transmission" (:xbps "transmission-gtk") (:cask "transmission"))
  ("postman" (:flatpak ("com.getpostman.Postman" "postman")) (:cask "postman"))
  ("nomachine" (:void) (:cask "nomachine"))
  ("diffmerge" (:void) (:cask "diffmerge"))
  ("virt-manager" (:xbps "qemu" "virt-manager"))
  ("libreoffice" (:cask "libreoffice"))
  ("blueman" (:mac))
  ("shotwell" (:cask "xnviewmp"))
  ("gimp" (:cask "gimp"))
  ("darktable" (:cask "darktable"))
  ("clementine" (:cask "clementine"))
  ("pavucontrol" (:mac))
  ("gstreamer" (:xbps "gstreamer1") (:mac))
  ("pipewire" (:xbps "pipewire" "alsa-pipewire" "libspa-bluetooth") (:mac))
  ("easyeffects" (:mac))
  ("audacity" (:mac))
  ("easytag" (:cask "kid3"))
  ("vlc" (:cask "vlc"))
  ("handbrake" (:cask "handbrake"))
  ("blender" (:cask "blender"))
  "youtube-dl"
  ("yt-dlp" (:void) (:mac))
  ("kodi" (:cask "kodi"))
  ("flameshot" (:mac))
  ("obs" (:cask "obs"))
  ("peek" (:cask "licecap"))
  ("keymon" (:void) (:cask "keycastr"))
  ("balena-etcher" (:void) (:cask "balenaetcher"))
  ("steam" (:cask "steam"))
  ("lutris" (:mac))
  ("origin" (:void) (:cask "origin"))
  ("gamehub" (:mac))
  ("sony-remote-play" (:void) (:cask "sony-ps4-remote-play"))
  ("razer-synapse" (:void) (:cask "razer-synapse"))
  ("barrier" (:cask "barrier"))
  ("font-open-sans" (:void) (:cask "font-open-sans"))
  ("font-inconsolata" (:void) (:cask "font-inconsolata"))
  ("font-liberation" (:void) (:cask "font-liberation"))
  ("font-roboto-mono" (:void) (:cask "font-roboto-mono"))
  ("font-fira-code" (:void) (:cask "font-fira-code"))
  )
 (
  "Install flatpak packages the conventional way"
  nil
  (:void ("~/.bin/linux/mt-flatpak-install postman com.getpostman.Postman"
          "~/.bin/linux/mt-flatpak-install schildi chat.schildi.desktop"))
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
  )
 (
  "Set up Docker"
  t
  (:void ("sudo groupadd docker"
          "sudo gpasswd -a ${USER} docker"
          "sudo ln -s /etc/sv/docker /var/service"))
  (:mac ("docker-machine create --driver virtualbox default"
         "eval ${docker-machine env default}"))
  )
 (
  "Change user shell"
  t
  (:void ("sudo usermod -s /bin/fish ismail"))
  (:mac ("echo \"/opt/homebrew/bin/fish\" | sudo tee -a /etc/shells"
         "chsh -s /opt/homebrew/bin/fish"))
  )
 (
  "Install Rust Toolchain"
  t
  (:void ("rustup-init --default-toolchain stable --profile default -y"))
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
         "( cd ~/_temp; wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v1.1.1/Bibata.tar.gz; tar -xvf Bibata.tar.gz )"
         "mv ~/_temp/Bibata-* ~/.local/share/icons"
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
         "mkdir ~/_temp"
         "curl --fail --location --show-error https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip --output ~/_temp/Fira_Code_v5.2.zip"
         "unzip -o -q -d ~/_temp ~/_temp/Fira_Code_v5.2.zip"
         "mv ~/_temp/ttf ~/.local/share/fonts/FiraCode"
         "rm -rf ~/_temp"
         "mkdir -p ~/.local/share/fonts"
         "mkdir ~/_temp"
         "( cd ~/_temp; wget https://github.com/liberationfonts/liberation-fonts/files/6418984/liberation-fonts-ttf-2.1.4.tar.gz; tar -xvf liberation-fonts-ttf-2.1.4.tar.gz )"
         "mkdir ~/.local/share/fonts/Liberation"
         "mv ~/_temp/liberation-fonts-ttf-2.1.4/Liberation*  ~/.local/share/fonts/Liberation/"
         "rm -rf ~/_temp"))
  )
 (
  "Set up pipewire with wireplumber and pipewire-pulse"
  t
  (:void ("sudo mkdir -p /etc/pipewire/pipewire.conf.d"
          "sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/"
          "sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/"))
  )
 (
  "Set up peripheral drivers"
  t
  (:void ("sudo xbps-install -Sy razergenie openrazer-meta"
          "sudo gpasswd -a $USER plugdev"))
  )
 (
  "Set up startup services"
  t
  (:void ("sudo ln -s /etc/sv/libvirtd /var/service"
          "sudo ln -s /etc/sv/virtlogd /var/service"
          "sudo ln -s /etc/sv/bluetoothd /var/service"
          "sudo ln -s /etc/sv/sshd /var/service"
          "sudo ln -s /etc/sv/avahi-daemon /var/service"))
  (:mac ("brew services start syncthing"
         "brew servies start avahi-daemon"))
  )
 (
  "Perform visual tweaks (non-working)"
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
  "Set Brave as the default web-browser"
  t
  (:all ("sudo cp ~/.assets/brave.desktop /usr/share/applications"
         "xdg-settings set default-web-browser brave.desktop"))
  )
 (
  "Install power-guard"
  t
  (:void ("git clone https://github.com/myTerminal/power-guard.git /tmp/power-guard"
          "( cd /tmp/power-guard; make install )"))
  )
 (
  "Install see-link"
  t
  (:void ("git clone https://github.com/myTerminal/see-link.git /tmp/see-link"
          "( cd /tmp/see-link; make install )"))
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
  "Link myTerminal/super-emacs to myterminal/dotfiles"
  t
  (:all ("mkdir /home/ismail/.config/emacs/configs"
         "ln -s ~/_workspace/github/super-emacs/.emacs.d ~/.config/emacs/configs/super-emacs"))
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
         "ln -s ~/_store/Mobile-Media ~/_mobile-media"))
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
