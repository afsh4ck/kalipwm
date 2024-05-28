# kalipwm

Deploy a professional hacking environment for Kali Linux, executing only one script.

![bspwm](https://github.com/afsh4ck/kalipwm/assets/132138425/cac4fb37-fd1b-43d5-a16f-90b867742da2)
![bspwm2](https://github.com/afsh4ck/kalipwm/assets/132138425/7a7890a3-71ef-4664-8435-560053eb87ba)

## Usage

- The use of a new/clean Kali Linux installation is recommended.
- Tested on Kali Linux 2024.1 with VMware, VirtualBox and bare metal.

1. clone repo `git clone https://github.com/afsh4ck/kalipwm.git`
2. Change directory `cd kalipwm`
3. Run script `./kalipwm.sh`
4. **Reboot** and switch to bspwm in the login screen.
5. Enjoy!

Wallpaper is taken from ~/Wallpapers/wallpaper.\*

## Commands

Note: On MacOS change Windows for Command, and Alt for Option

| Command                    | Description                                               |
|---------------------------|-----------------------------------------------------------|
| Right-click on Polybar     | Change the Polybar theme using the right-click menu.       |
| Windows + 1,2,3,4          | Navigate between numbered desktops.                        |
| Windows + Enter            | Open a new terminal.                                       |
| Windows + Enter            | Split the current terminal.                                |
| Windows + Arrows           | Navigate between open windows.                             |
| Windows + Tab              | Switch between the two most recent desktops.              |
| Windows + W                | Close the current terminal.                                |
| Windows + Alt + R          | Reload the desktop environment.                            |
| Windows + Alt + Q          | Restart BSPWM.                                            |
| Windows + Alt + Arrows     | Resize the current window.                                 |
| Windows + Shift + F        | Open Firefox.                                             |
| Windows + Shift + B        | Open Burp Suite.                                          |
| Windows + Shift + 1,2,3,4   | Move the current window to another numbered desktop.      |
| Windows + Shift + Arrows   | Move the current window.                                   |
| Ctrl + Shift + -+          | Change the terminal text size.                             |
| Ctrl + T                   | Open an advanced browser from the terminal.               |
| .config/sxhkd/sxhkdrc      | Shortcut configuration file (sxhkd).                      |
| .config/bspwm/bspwmrc       | BSPWM configuration file.                                 |
| .config/polybar            | Folder with Polybar themes.                                |
| .config/kitty/kitty.conf   | Default configuration file for the Kitty terminal.         |
| ~/Wallpapers               | Wallpaper folder. Only one file named wallpaper.jpg allowed.|
| target 10.0.0.1            | Select a target IP displayed in Polybar.                  |
| target reset               | Remove the selected target.                               |
| tmux                       | Switch the terminal to tmux.                              |
| tmux —help                 | Display tmux help.                                       |
| p10k configure             | Configure the Powerlevel10K terminal theme.               |
| .zshrc                     | ZSH configuration file and command aliases.               |
| bpython                    | Interactive Python in the terminal.                       |


## You will install:

### Main packages

- Hack Nerd Fonts
- Kitty
- Rmux + oh my tmux
- lsd
- Python + pip + bpython
- Neofetch
- Batcat
- Scrot
- feh
- oh my zsh + plugins
- Powerlevel10k
- Rofi
- Bspwm
- Polybar
- Sxhkd
- Picom
- Neovim

## Credits

Big inspiration taken from xJackSx [repo](https://github.com/xJackSx/BSPWMparrot).

## Support

<a href="https://www.buymeacoffee.com/afsh4ck" rel="nofollow"><img width="250" alt="buymeacoffe" src="https://camo.githubusercontent.com/cd9a722712fec4278ef95ff114b458897a37a52ef8129b6c833efcf8c66e2211/68747470733a2f2f63646e2e6275796d6561636f666665652e636f6d2f627574746f6e732f76322f64656661756c742d6f72616e67652e706e67" data-canonical-src="https://cdn.buymeacoffee.com/buttons/v2/default-orange.png" style="max-width: 100%;"></a></p>

