# kalipwm

Despliega un entorno de hacking profesional para Kali Linux ejecutando solo un script.

## Instalación y uso

- Se recomienda el uso de una instalación nueva/limpia de Kali Linux.
- Probado en Kali Linux 2024.1 con VMware, VirtualBox y Bare Metal.

```
git clone https://github.com/afsh4ck/kalipwm.git
cd kalipwm
bash kalipwm.sh
sudo reboot
```
- Una vez reiniciado cambia a bspwm en la pantalla de inicio de sesión
- El fondo de pantalla se toma de ~/Wallpapers/wallpaper.*
- Video completo del entorno: https://youtu.be/3clLjO8W7Q4?si=GupOi6Bqwuu2O9Wk

## Comandos

Nota: En MacOS, cambia Windows por Command, y Alt por Option

| Comando                     | Descripción                                                 |
|-----------------------------|-------------------------------------------------------------|
| Clic derecho en Polybar     | Cambia el tema de Polybar usando el menú del clic derecho   |
| Windows + 1,2,3,4           | Navega entre escritorios                                    |
| Windows + Enter             | Abre una nueva terminal                                     |
| Windows + Enter             | Divide la terminal actual                                   |
| Windows + Flechas           | Navega entre ventanas abiertas                              |
| Windows + Tab               | Cambia entre los dos escritorios más recientes              |
| Windows + W                 | Cierra la terminal actual                                   |
| Windows + Alt + R           | Recarga el entorno de escritorio                            |
| Windows + Alt + Q           | Reinicia BSPWM                                              |
| Windows + Alt + Flechas     | Redimensiona la ventana actual                              |
| Windows + Shift + F         | Abre Firefox                                                |
| Windows + Shift + B         | Abre Burp Suite                                             |
| Windows + Shift + 1,2,3,4   | Mueve la ventana actual a otro escritorio                   |
| Windows + Shift + Flechas   | Mueve la ventana actual                                     |
| Ctrl + Shift + -+           | Cambia el tamaño del texto en la terminal                   |
| Ctrl + T                    | Abre un navegador avanzado desde la terminal                |
| .config/sxhkd/sxhkdrc       | Archivo de configuración de atajos (sxhkd)                  |
| .config/bspwm/bspwmrc       | Archivo de configuración de BSPWM                           |
| .config/polybar             | Carpeta con temas de Polybar                                |
| .config/kitty/kitty.conf    | Archivo de configuración predeterminado para el terminal Kitty  |
| ~/Wallpapers                | Carpeta de fondos de pantalla. Solo se permite un archivo llamado wallpaper.jpg  |
| target 10.0.0.1             | Selecciona una IP de destino mostrada en Polybar            |
| target reset                | Elimina el objetivo seleccionado                            |
| tmux                        | Cambia la terminal a tmux                                   |
| tmux —help                  | Muestra la ayuda de tmux                                    |
| p10k configure              | Configura el tema de terminal Powerlevel10K                 |
| .zshrc                      | Archivo de configuración de ZSH y alias de comandos         |
| bpython                     | Python interactivo en la terminal                           |

## Paquete incluídos:

```
Bspwm
Polybar
Oh my zsh + Plugins
Powerlevel10k
Hack Nerd Fonts
Python + pip + bpython
Tmux + Oh my tmux
Kitty
lsd
Neofetch
Batcat
Scrot
feh
Rofi
Sxhkd
Picom
Neovim
```

## Novedades
Esta versión incluye:
- Soporte para 2 monitores
- Cambios en la interfaz del tema `forest` de la polybar
- Algunos atajos extra para la terminal

### Soporte para 2 monitores
Está implementado el funcionamiento para que, conectado un monitor externo (en mi caso por HDMI) sólo se usará esta pantalla externa, la pantalla interna del portátil permanecerá apagada, este comportamiento se puede modificar en el `bspwmrc`. 
Es más, es muy probable que debas modificarlo, dado la posibilidad de que tu ordenador haya nombrado distinto a tus pantallas, en caso de tener que hacerlo, habrá que hacer cambios en el `bspwmrc`. En caso de no querer apagar el monitor, no pongas el `--off` y repite la línea de arriba

```bash
if [[ $SCREEN -eq 1 ]]; then
        # Define la pantalla interior eDP-1 como prmiaria con resolución 1366x768
        xrandr --output eDP-1 --primary --mode 1366x768

        # asignar los 10 workspaces a la pantalla interna
        bspc monitor eDP-1 -d 1 2 3 4 5 6 7 8 9 0
fi
# Con monitor externo
if [[ $SCREEN -eq 2 ]]; then

        # Dimensionar el externo, lo pone como primario, define su resolución y apaga el monitor del portátil
        xrandr --output HDMI-2 --primary --mode 1920x1080
        xrandr --output eDP-1 --off

        # asignar los 10 workspaces a la pantalla interna
        bspc monitor HDMI-2 -d 1 2 3 4 5 6 7 8 9 0
fi
```

> Para comprobar los nombres
`xrandr | grep " connected "`  qeu devolverá todos los conectados, donde normalmente `eDP-1` suele se la interna, pero bueno, es ir mirando y probando.

### Ajustes de la polybar.
Con el fin de tener la polybar con distintas configuraciones de monitores, también se tendrán varias de polybar, en este caso, se ha definido una `bar/main` para usar con el externo y otra `bar/main_internal` para la del portátil, cargando en cada caso una barra distinta en la polybar. Estos cambios realizados en `polybar/forest/launch.sh`

```bash
if [ "$EXTERNAL_MONITOR" ]; then
    # Si hay un monitor externo, lanzar la barra en el monitor externo
    MONITOR=$EXTERNAL_MONITOR polybar -q main -c "$dir/config.ini" &
else
    # Si no hay un monitor externo, lanzar la barra en el monitor interno
    MONITOR=$INTERNAL_MONITOR polybar -q main_internal -c "$dir/config.ini" &
fi
```

Por otro lado, se han añadido modulos personalizados en el archivo `polybar/forest/user_modules.ini`, desde ahí se cargan los scripts propios para obneter la IP de la `wlan0`, `eth0` y la `tun0`, que se pueden modificar por si se quieren otras interfaces en sus propios scripts qeu están en `polybar/forest/scripts` o en la carpeta `SCRIPTS` de este repositorio.

También, se ha modificado el orden de la información a mostrar en la polybar, y eso se hace en `polybar/forest/config.ini`

```ini
modules-left = launcher sep custom_eth custom_wlan custom_vpn
modules-center = workspaces
modules-right = target date sep sysmenu
```

### Adiciones de atajos
Dentro de ZSH, en el `zshrc` se añaden un atajo para lanzar una conexión VPN, donde hay qeu cambiar la ruta, para la vuestra, o eliminarlo si no lo quereis.

```bash
alias htb='sudo openvpn --config /ruta/al/archivo.ovpn'
```

Por último, de cara al uso con hack the box, esñta la función `mk` para crear las carpetas requeridas para organizar mejor las pruebas sobre las máquinas



## Créditos
- Autor:       afsh4ck 
- Instagram:   <a href="https://www.instagram.com/afsh4ck">afsh4ck</a>
- Youtube:     <a href="https://youtube.com/@afsh4ck">afsh4ck</a>
- Editor       PoleG97

## Soporte

<a href="https://www.buymeacoffee.com/afsh4ck" rel="nofollow"><img width="250" alt="buymeacoffe" src="https://camo.githubusercontent.com/b046532cac63358f348a2cf0b9f45916e7a13de1a2ccb4ebef504b0a882bb2b3/68747470733a2f2f63646e2e6275796d6561636f666665652e636f6d2f627574746f6e732f76322f64656661756c742d6f72616e67652e706e67" data-canonical-src="https://cdn.buymeacoffee.com/buttons/v2/default-orange.png" style="max-width: 100%;"></a>

