#!/bin/bash

# Comprobar si el usuario actual es root
if [ "$UID" -eq 0 ]; then
    echo "No se puede ejecutar como root."
    exit 1
else
    # Comprobar si se está usando sudo
    if [ -n "$SUDO_USER" ]; then
        echo "No uses sudo"
        exit 1
    fi
fi

echo "
██╗  ██╗ █████╗ ██╗     ██╗██████╗ ██╗    ██╗███╗   ███╗
██║ ██╔╝██╔══██╗██║     ██║██╔══██╗██║    ██║████╗ ████║
█████╔╝ ███████║██║     ██║██████╔╝██║ █╗ ██║██╔████╔██║
██╔═██╗ ██╔══██║██║     ██║██╔═══╝ ██║███╗██║██║╚██╔╝██║
██║  ██╗██║  ██║███████╗██║██║     ╚███╔███╔╝██║ ╚═╝ ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝
"
sleep 2
echo -e "[+] Script de automatización de entorno de hacking profesional."
echo -e "[+] @afsh4ck - Sígueme en: YouTube, Instagram, TikTok"
sleep 3
echo -e "\n[*] Configurando la instalación..\n"
sleep 4

RPATH=`pwd`

# Actualizar paquetes
sudo apt update && sudo apt -y upgrade

# Instalar paquetes
sudo apt install -y git bspwm vim feh scrot scrub zsh rofi xclip xsel locate wmname acpi sxhkd \
imagemagick ranger kitty tmux python3-pip font-manager lsd bpython open-vm-tools-desktop open-vm-tools fastfetch # (neofetch obsoleto)

# Instalar dependencias del entorno
sudo apt install -y build-essential libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev \
libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev # (xcb eliminado)

# Instalar requisitos de polybar
sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev \
libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev \
libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev \
libmpdclient-dev libuv1-dev libnl-genl-3-dev

# Instalar dependencias de picom
sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev \
libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev \
libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev \
uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3 libpcre3-dev

# Instalar fuentes
mkdir /tmp/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip -O /tmp/fonts/Hack.zip
unzip /tmp/fonts/Hack.zip -d /tmp/fonts
font-manager -i /tmp/fonts/*.ttf

# Instalar ohmyzsh
rm -rf ~/.oh-my-zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
rm -f ~/.p10k.zsh
cp -v $RPATH/CONFIGS/p10k.zsh ~/.p10k.zsh

# Instalar plugins de zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
rm -f ~/.zshrc
# ¿Instalar zsh-autocomplete?
cp -v $RPATH/CONFIGS/zshrc ~/.zshrc

# Instalar fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# .tmux
rm -rf ~/.tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/
cp -v $RPATH/CONFIGS/tmux.conf.local ~/.tmux.conf.local

# nvim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -O /tmp/nvim-linux64.tar.gz
sudo tar xzvf /tmp/nvim-linux64.tar.gz --directory=/opt
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim
sudo rm -f /opt/nvim-linux64.tar.gz

# Instalar terminal kitty
cat $RPATH/kitty-installer.sh | sh /dev/stdin
# ~/.local/kitty.app/bin/kitty

# batcat
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb -O /tmp/bat.deb
sudo dpkg -i /tmp/bat.deb

# Clonar repositorios de polybar & picom
mkdir ~/github
git clone --recursive https://github.com/polybar/polybar ~/github/polybar
git clone https://github.com/ibhagwan/picom.git ~/github/picom

# Instalar polybar
cd ~/github/polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

# Instalar temas de polybar
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git ~/github/polybar-themes
chmod +x ~/github/polybar-themes/setup.sh
cd ~/github/polybar-themes
echo 1 | ./setup.sh

# Instalar picom
cd ~/github/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# Cambiar zona horaria
# Para listar zonas horarias ejecutar: timedatectl list-timezones
sudo timedatectl set-timezone "Europe/Madrid"

mkdir ~/screenshots
# Copiar todos los archivos de configuración
cp -rv $RPATH/CONFIGS/config/* ~/.config/

# Copiar scripts
cp -rv $RPATH/SCRIPTS/* ~/.config/polybar/forest/scripts/
sudo ln -s ~/.config/polybar/forest/scripts/target.sh /usr/bin/target
sudo ln -s ~/.config/polybar/forest/scripts/screenshot.sh /usr/bin/screenshot

# Copiar wallpapers
mkdir ~/Wallpapers/
cp -rv $RPATH/WALLPAPERS/* ~/Wallpapers/

# Establecer permisos de ejecución
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/forest/scripts/target.sh
chmod +x ~/.config/polybar/forest/scripts/screenshot.sh

# Seleccionar tema de rofi
# rofi-theme-selector

# Habilitar toque para hacer clic y cambiar dirección de desplazamiento del touchpad (portátiles) https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/
# sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
# Section "InputClass"
#        Identifier "touchpad"
#        MatchIsTouchpad "on"
#        Driver "libinput"
#        Option "Tapping" "on"
#        Option "NaturalScrolling" "on"
# EndSection
#
# EOF

# Limpiar archivos
rm -rf ~/github
rm -rf $RPATH
sudo apt autoremove -y

echo -e "\n[+] Entorno desplegado, Happy Hacking ;) \n"
echo -e "\n[+] Por favor, reinicia el equipo (sudo reboot) \n"
