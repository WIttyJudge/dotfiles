# Dotfiles

## Info

* Settings for: 
  * zsh (shell)
  * neovim (text editor)
  * i3 (tilling window manager)
  * polybar (status bar)
  * urxvt (terminal)
  * sxiv (image viewer)
  * neofetch (system information tool)

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
$ git clone https://github.com/WIttyJudge/dotfiles ~/
$ cd ~/dotfiles
$ bash setup.sh
```

After this, restart session.
