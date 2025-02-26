# KaliPWM

Despliega un entorno de hacking profesional para Kali Linux ejecutando solo un script.

![kalipwm-1](https://github.com/user-attachments/assets/0e11571f-7c71-416f-9bb8-32ab9c47d015)
![kalipwm-2](https://github.com/user-attachments/assets/b67853d2-922d-4303-90a8-4fbc2564555a)

## Instalación y uso

- Se recomienda el uso de una instalación nueva/limpia de Kali Linux.
- Testado en Kali Linux 2024.4 con VMware, VirtualBox y Bare Metal.

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

> [!NOTE]
> En MacOS, cambia Windows por Command, y Alt por Option.

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
| Windows + Alt + Q           | Reiniciar BSPWM                                             |
| Windows + Alt + Flechas     | Redimensiona la ventana actual                              |
| Windows + Shift + F         | Abre Firefox                                                |
| Windows + Shift + B         | Abre Burp Suite                                             |
| Windows + Shift + A         | Abre el gestor de archivos Thunar                           |
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

## Paquetes incluídos:

```
Bspwm
Polybar
Oh my zsh + Plugins
Powerlevel10k
Hack Nerd Fonts
JetBrains Font
Python + pip + bpython
Tmux + Oh my tmux
Kitty
lsd
Batcat
Fastfetch
Scrot
feh
Rofi
Sxhkd
Picom
Neovim
```

## Créditos
- Autor:       afsh4ck 
- Instagram:   <a href="https://www.instagram.com/afsh4ck">afsh4ck</a>
- Youtube:     <a href="https://youtube.com/@afsh4ck">afsh4ck</a>

## Soporte

<a href="https://www.buymeacoffee.com/afsh4ck" rel="nofollow"><img width="250" align="left">
![buy-me-a-coffe](https://github.com/user-attachments/assets/8c8f9e81-334e-469e-b25e-29888cfc9fcc)
</a>
