![Dotfiles](github-assets/dotfiles-logo.png)

Repository dedicated to my configuration files of my Desktop environment, with the purpose of backup and sharing.

## Description
(*) - program I currently use.

| Type                    	| Program            	                                            |
|:------------------------	|:--------------------------------------------------------------  |
| App Launcher              | [dmenu]() (*) / [rofi](https://github.com/davatorium/rofi)                    	|
| Hotkey Daemon             | [sxhkd](https://github.com/baskerville/sxhkd)                   |
| Image Viewer            	| [sxiv](https://wiki.archlinux.org/index.php/sxiv)               |
| Notification Daemon       | [dunst](https://github.com/dunst-project/dunst)                 |
| Shell                   	| [zsh](https://wiki.archlinux.org/index.php/zsh)                	|
| Status Bar              	| [dwmblocks]() (*) / [polybar](https://github.com/polybar/polybar)                   |
| Screenshot Tool           | [flameshot](https://github.com/flameshot-org/flameshot#features)|
| System Information Tool 	| [neofetch](https://github.com/dylanaraps/neofetch)           	  |
| Terminal                	| [alacritty](https://github.com/alacritty/alacritty) (*) / [urxvt](https://wiki.archlinux.org/index.php/rxvt-unicode) / [terminator](https://wiki.archlinux.org/index.php/Terminator)|
| Text Editor             	| [neovim](https://github.com/neovim/neovim)             	        |
| Window Manager            | [dwm]() (*) / [i3](https://wiki.archlinux.org/index.php/i3)                   |

All configs will be symlinked to ``~/.config/`` folder.
Useful scripts stored in ``scripts`` folder and symlinked to ``~/.local/bin`` folder.
Environment variables have been set in ``.zprofile`` file.

## Requirement

I used [GNU Stow](https://www.gnu.org/software/stow) for creating
a symlinks to files.

Install stow and git with the package manager your linux uses.

Ubuntu:

```
$ sudo apt install -y stow git
```

Arch Linux:

```
$ sudo pacman -S stow git
```

etc..

## Install

```
$ git clone https://github.com/WIttyJudge/dotfiles ~/ && cd ~/dotfiles
$ bash setup.sh
```

After this, restart session.
