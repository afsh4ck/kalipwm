# kalipwm

Despliega un entorno de hacking profesional para Kali Linux ejecutando solo un script.

![bspwm](https://github.com/afsh4ck/kalipwm/assets/132138425/cac4fb37-fd1b-43d5-a16f-90b867742da2)
![bspwm2](https://github.com/afsh4ck/kalipwm/assets/132138425/7a7890a3-71ef-4664-8435-560053eb87ba)

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
Hack Nerd Fonts
Kitty
Tmux + oh my tmux
lsd
Python + pip + bpython
Neofetch
Batcat
Scrot
feh
oh my zsh + plugins
Powerlevel10k
Rofi
Bspwm
Polybar
Sxhkd
Picom
Neovim
```

## Soporte

<a href="https://www.buymeacoffee.com/afsh4ck" rel="nofollow"><img width="250" alt="buymeacoffe" src="https://camo.githubusercontent.com/cd9a722712fec4278ef95ff114b458897a37a52ef8129b6c833efcf8c66e2211/68747470733a2f2f63646e2e6275796d6561636f666665652e636f6d2f627574746f6e732f76322f64656661756c742d6f72616e67652e706e67" data-canonical-src="https://cdn.buymeacoffee.com/buttons/v2/default-orange.png" style="max-width: 100%;"></a>
