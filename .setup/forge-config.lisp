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
  ("zip" (:mac))
  ("unzip" (:mac))
  "7zip"
  "unrar"
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
  ("fprintd" (:mac))
  ("chrony" (:mac))
  ("btrfs-progs" (:mac))
  ("ntfs-3g" (:mac))
  ("dosfstools" (:mac))
  ("mtools" (:mac))
  ("exfat-utils" (:mac))
  ("android-tools" (:cask "android-platform-tools"))
  ("cronie" (:mac))
  "rlwrap"
  ("sed" (:brew "gnu-sed"))
  "jq"
  "neofetch"
  "wget"
  "curl"
  "avahi"
  ("openssh" (:mac))
  ("ollama" (:cask "ollama") (:void))
  ("xdg-utils" (:mac))
  ("xorg" (:mac))
  ("numlockx" (:mac))
  ("sct" (:mac))
  ("gammastep" (:mac))
  ("onboard" (:mac))
  ("picom" (:mac))
  ("i3" (:xbps "i3" "i3status" "i3lock") (:mac))
  ("sway" (:mac))
  ("Waybar" (:mac))
  ("xrandr" (:mac))
  ("wlr-randr" (:mac))
  ("xss-lock" (:mac))
  ("swaylock" (:mac))
  ("feh" (:mac))
  ("swaybg" (:mac))
  ("rofi" (:mac))
  ("fuzzel" (:mac))
  ("rxvt-unicode" (:cask "alacritty"))
  ("foot" (:mac))
  ("xsel" (:mac))
  ("wl-clipboard" (:mac))
  ("dunst" (:mac))
  ("mako" (:mac))
  ("udiskie" (:mac))
  ("gparted" (:mac))
  ("thunar" (:xbps "Thunar") (:mac))
  ("gvfs" (:mac))
  ("syncthing" (:xbps "syncthing-gtk"))
  ("meld" (:cask "meld"))
  ("logseq" (:flatpak ("com.logseq.Logseq" "logseq")) (:cask "loqseq"))
  ("firefox" (:cask "firefox"))
  ("chromium" (:cask "chromium"))
  ("keepassxc" (:cask "keepasxc"))
  ("thunderbird" (:mac))
  ("schildi" (:flatpak ("chat.schildi.desktop" "schildi")) (:cask "schildichat"))
  ("pcloud" (:void) (:mac))
  ("transmission" (:xbps "transmission-gtk") (:cask "transmission"))
  ("postman" (:flatpak ("com.getpostman.Postman" "postman")) (:cask "postman"))
  ("virt-manager" (:xbps "qemu" "virt-manager"))
  ("libreoffice" (:cask "libreoffice"))
  ("blueman" (:mac))
  ("krita" (:cask "krita"))
  ("shotwell" (:cask "xnviewmp"))
  ("gimp" (:cask "gimp"))
  ("darktable" (:cask "darktable"))
  ("clementine" (:cask "clementine"))
  ("pavucontrol" (:mac))
  ("gstreamer" (:xbps "gstreamer1") (:mac))
  ("pipewire" (:xbps "pipewire" "alsa-pipewire" "libspa-bluetooth") (:mac))
  ("easyeffects" (:mac))
  ("audacity" (:mac))
  ("vlc" (:cask "vlc"))
  ("handbrake" (:cask "handbrake"))
  ("blender" (:cask "blender"))
  ("yt-dlp" (:void) (:mac))
  ("kodi" (:cask "kodi"))
  ("flameshot" (:mac))
  ("grim" (:mac))
  ("slurp" (:mac))
  ("swappy" (:mac))
  ("obs" (:flatpak ("com.obsproject.Studio" "obs")) (:cask "obs"))
  ("obs-plugin-waveform" (:flatpak ("com.obsproject.Studio.Plugin.waveform" "obs-plugin-waveform")) (:mac))
  ("peek" (:cask "licecap"))
  ("keymon" (:void) (:cask "keycastr"))
  ("balena-etcher" (:void) (:cask "balenaetcher"))
  ("steam" (:cask "steam"))
  ("lutris" (:mac))
  ("origin" (:void) (:cask "origin"))
  ("gamehub" (:mac))
  ("sony-remote-play" (:void) (:cask "sony-ps4-remote-play"))
  ("qFlipper" (:flatpak ("one.flipperzero.qFlipper" "qFlipper")) (:cask "qflipper"))
  ("font-open-sans" (:void) (:cask "font-open-sans"))
  ("font-inconsolata" (:void) (:cask "font-inconsolata"))
  ("font-liberation" (:void) (:cask "font-liberation"))
  ("font-roboto-mono" (:void) (:cask "font-roboto-mono"))
  ("font-fira-code" (:void) (:cask "font-fira-code"))
  )
 (
  "Install flatpak packages the conventional way"
  nil
  (:void ("~/.bin/linux/mt-flatpak install logseq com.logseq.Logseq"
          "~/.bin/linux/mt-flatpak install postman com.getpostman.Postman"
          "~/.bin/linux/mt-flatpak install schildi chat.schildi.desktop"
          "~/.bin/linux/mt-flatpak install obs-studio com.obsproject.Studio"
          "~/.bin/linux/mt-flatpak install qFlipper one.flipperzero.qFlipper"))
  )
 (
  "Enable hidden items in Finder"
  nil
  (:mac ("defaults write com.apple.Finder AppleShowAllFiles YES"
         "killall Finder"))
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
  "Install Mesa Drivers"
  t
  (:void ("~/.setup/hardware/void/other/mesa"))
  )
 (
  "Install Graphical Theming: GTK theme"
  t
  (:void ("mkdir -p ~/.local/share/themes"
          "git clone https://github.com/madmaxms/theme-obsidian-2.git ~/_temp"
          "git -C ~/_temp checkout gray"
          "mv ~/_temp/Obsidian-2-Gray ~/.local/share/themes/"
          "rm -rf ~/_temp"))
  )
 (
  "Install Graphical Theming: Icon theme"
  t
  (:void ("mkdir -p ~/.local/share/icons"
          "git clone https://github.com/madmaxms/iconpack-obsidian ~/_temp"
          "mv ~/_temp/Obsidian* ~/.local/share/icons/"
          "rm -rf ~/_temp"))
  )
 (
  "Install Graphical Theming: Cursor theme"
  t
  (:void ("mkdir -p ~/.local/share/icons"
          "mkdir ~/_temp"
          "( cd ~/_temp; wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v1.1.1/Bibata.tar.gz; tar -xvf Bibata.tar.gz )"
          "mv ~/_temp/Bibata-* ~/.local/share/icons"
          "rm -rf ~/_temp"))
  )
 (
  "Install Fonts"
  t
  (:void ("mkdir -p ~/.local/share/fonts"
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
  "Fetch perl extensions for for rxvt"
  t
  (:void ("sudo xbps-install -Sy xclip"
          "sudo wget \"https://pastebin.com/raw/QHk1NyPS\" -O /usr/lib/urxvt/perl/clipboard"
          "sudo wget \"https://raw.githubusercontent.com/simmel/urxvt-resize-font/master/resize-font\" -O /usr/lib/urxvt/perl/resize-font"))
  )
 (
  "Prepare /store/ismail and ~/_store"
  t
  (:void ("sudo mkdir /store/ismail"
          "sudo chown -R ismail:ismail /store/ismail"
          "sudo chmod -R g-rwx,o-rwx /store/ismail"
          "mkdir ~/_store"
          "sudo mount --rbind /store/ismail ~/_store"
          "echo \"/store/ismail /home/ismail/_store none bind 0 0\" | sudo tee -a /etc/fstab"))
  )
 (
  "Set up startup services"
  t
  (:void ("sudo ln -s /etc/sv/libvirtd /var/service"
          "sudo ln -s /etc/sv/virtlogd /var/service"
          "sudo ln -s /etc/sv/bluetoothd /var/service"
          "sudo ln -s /etc/sv/sshd /var/service"
          "sudo ln -s /etc/sv/avahi-daemon /var/service"
          "sudo ln -s /etc/sv/cronie /var/service"
          "mkdir ~/.services"
          "cp -R ~/.assets/services/syncthing ~/.services/"
          "sudo cp -R ~/.assets/services/runsvdir-ismail /etc/sv/"
          "sudo ln -s /etc/sv/runsvdir-ismail /var/service"))
  (:mac ("brew services start syncthing"
         "brew services start avahi-daemon"
         "brew services start ollama"))
  )
 (
  "Set up new as a new Syncthing device"
  t
  (:void ("mv ~/.local/state/syncthing /store/ismail/.syncthing"))
  )
 (
  "Link /store/ismail/.syncthing to ~/.config/syncthing"
  t
  (:void ("ln -s /store/ismail/.syncthing ~/.config/syncthing"))
  )
 (
  "Perform visual tweaks (non-working)"
  t
  (:void ("wget -O - https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh | bash"))
  )
 (
  "Install power-guard"
  t
  (:void ("git clone https://github.com/myTerminal/power-guard.git /tmp/power-guard"
          "( cd /tmp/power-guard; make install )"))
  )
 (
  "Install global NPM packages"
  t
  (:all ("sudo npm install -g lite-server nano-server stay-with-me git-getter re-write"))
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
         "mkdir ~/_workspace/github"))
  )
 (
  "Start X11 to configure SSH keys and Syncthing"
  t
  (:void ("~/.scripts/linux/startup/cli && startx"))
  )
 (
  "Next steps depend on SSH keys and Syncthing setup"
  t
  (:all ("echo \"Continuing...\""))
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
         "ln -s ~/_workspace/github ~/_github"))
  )
 (
  "Re-generate symlinks for binaries"
  t
  (:all ("~/.setup/regenerate-binary-symlinks"))
  )
 (
  "Set up Ollama"
  t
  (:void ("cp -R ~/.assets/services/ollama-runit ~/.services/ollama"
          "ollama pull llama3"))
  )
 (
  "Perform a few package-dependent config"
  nil
  (:void ("sudo usermod -aG libvirt ismail"
          "xfconf-query --channel thunar -p /default-view -s ThunarDetailsView"
          "xfconf-query --channel thunar -p /last-location-bar -s ThunarLocationButtons"
          "xfconf-query --channel thunar -p /last-show-hidden -s true"))
  )
 (
  "Set Firefox as the default web-browser"
  t
  (:void ("xdg-settings set default-web-browser firefox.desktop"))
  )
 (
  "Enable touch scrolling for Firefox"
  t
  (:void ("echo \"
MOZ_USE_XINPUT2 DEFAULT=1
\" | sudo tee -a /etc/security/pam_env.conf"))
  )
 (
  "Tag machine with ~/.mt-tag"
  t
  (:all ("touch ~/.mt-tag"))
  )
 )
