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
echo -e "[+] @afsh4ck - ¡Sígueme en YouTube e Instagram!"
sleep 3
echo -e "\n[*] Configurando la instalación..\n"
sleep 4

RPATH=`pwd`

# Actualizar y actualizar todo
sudo apt update && sudo apt -y full-upgrade

# Instalar paquetes
sudo apt install -y git vim feh scrot scrub zsh rofi xclip xsel locate neofetch wmname acpi bspwm sxhkd \
imagemagick ranger kitty tmux python3-pip font-manager lsd bpython open-vm-tools-desktop open-vm-tools # snapd

# Instalar dependencias del entorno
sudo apt install -y build-essential libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev \
libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev # (xcb removed)

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

# nvchad - necesita trabajo. Bloquear cursor e interacción del usuario
# git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

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

# Crear el script config_help
cat << 'EOF' | sudo tee /usr/bin/config_help > /dev/null
#!/bin/bash
printf "\
%-30s %s\n" "Clic derecho en Polybar" "Cambia el tema de Polybar usando el menú del clic derecho"
printf "%-30s %s\n" "Windows + 1,2,3,4" "Navega entre escritorios"
printf "%-30s %s\n" "Windows + Enter" "Abre una nueva terminal"
printf "%-30s %s\n" "Windows + Enter" "Divide la terminal actual"
printf "%-30s %s\n" "Windows + Flechas" "Navega entre ventanas abiertas"
printf "%-30s %s\n" "Windows + Tab" "Cambia entre los dos escritorios más recientes"
printf "%-30s %s\n" "Windows + W" "Cierra la terminal actual"
printf "%-30s %s\n" "Windows + Alt + R" "Recarga el entorno de escritorio"
printf "%-30s %s\n" "Windows + Alt + Q" "Reinicia BSPWM"
printf "%-30s %s\n" "Windows + Alt + Flechas" "Redimensiona la ventana actual"
printf "%-30s %s\n" "Windows + Shift + F" "Abre Firefox"
printf "%-30s %s\n" "Windows + Shift + B" "Abre Burp Suite"
printf "%-30s %s\n" "Windows + Shift + 1,2,3,4" "Mueve la ventana actual a otro escritorio"
printf "%-30s %s\n" "Windows + Shift + Flechas" "Mueve la ventana actual"
printf "%-30s %s\n" "Ctrl + Shift + -+" "Cambia el tamaño del texto en la terminal"
printf "%-30s %s\n" "Ctrl + T" "Abre un navegador avanzado desde la terminal"
printf "%-30s %s\n" ".config/sxhkd/sxhkdrc" "Archivo de configuración de atajos (sxhkd)"
printf "%-30s %s\n" ".config/bspwm/bspwmrc" "Archivo de configuración de BSPWM"
printf "%-30s %s\n" ".config/polybar" "Carpeta con temas de Polybar"
printf "%-30s %s\n" ".config/kitty/kitty.conf" "Archivo de configuración predeterminado para el terminal Kitty"
printf "%-30s %s\n" "~/Wallpapers" "Carpeta de fondos de pantalla. Solo se permite un archivo llamado wallpaper.jpg"
printf "%-30s %s\n" "target 10.0.0.1" "Selecciona una IP de destino mostrada en Polybar"
printf "%-30s %s\n" "target reset" "Elimina el objetivo seleccionado"
printf "%-30s %s\n" "tmux" "Cambia la terminal a tmux"
printf "%-30s %s\n" "tmux --help" "Muestra la ayuda de tmux"
printf "%-30s %s\n" "p10k configure" "Configura el tema de terminal Powerlevel10K"
printf "%-30s %s\n" ".zshrc" "Archivo de configuración de ZSH y alias de comandos"
printf "%-30s %s\n" "bpython" "Python interactivo en la terminal"
EOF

# Asignar permisos de ejecución al script config_help
sudo chmod +x /usr/bin/config_help

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

echo -e "\n[+] Listo, Happy Hacking ;)\n"
echo -e "\n[+] Por favor, reinicia el equipo ;)\n"
