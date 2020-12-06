# Dotfiles

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
