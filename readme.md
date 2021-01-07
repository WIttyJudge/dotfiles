# Dotfiles

Repository dedicated to my configuration files of my Desktop environment, with the purpose of backup and sharing.

## Setup Description

| Type                    	| Program            	                                            |
|:------------------------	|:--------------------------------------------------------------  |
| App Launcher              | [rofi](https://github.com/davatorium/rofi)                    	|
| Shell                   	| [zsh](https://wiki.archlinux.org/index.php/zsh)                	|
| Window Manager            | [i3](https://wiki.archlinux.org/index.php/i3)                   |
| Text Editor             	| [neovim](https://github.com/neovim/neovim)             	        |
| Status Bar              	| [polybar](https://github.com/polybar/polybar)                   |
| Terminal                	| [urxvt](https://wiki.archlinux.org/index.php/rxvt-unicode) / [terminator](https://wiki.archlinux.org/index.php/Terminator)|
| Image Viewer            	| [sxiv](https://wiki.archlinux.org/index.php/sxiv)               |
| System Information Tool 	| [neofetch](https://github.com/dylanaraps/neofetch)           	  |  

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

## Usage

```
$ git clone https://github.com/WIttyJudge/dotfiles ~/ && cd ~/dotfiles
$ bash setup.sh
```

After this, restart session.
