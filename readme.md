# Dotfiles

Repository dedicated to my configuration files of my Desktop environment, with the purpose of backup and sharing.

## Info

* Settings for: 

| Type                    	| Program            	|
|:------------------------	|:-------------------	|
| Shell                   	| zsh                	|
| Text Editor             	| neovim             	|
| Status Bar              	| polybar            	|
| Terminal                	| urxvt / terminator 	|
| Image Viewer            	| sxiv               	|
| System Information Tool 	| neofetch           	|
|                         	|                    	|

If you want to use settings for, uncomments it in ``setup.sh``:
  * terminator (terminal)  

All configs will be symlinked to ``~/.config/`` folder.  
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
