# Dotfiles

## Requirement

I used [GNU Stow](https://www.gnu.org/software/stow) for creating
a symlinks to files.

Install stow and git with the PM your linux uses.
e.g. apt in Ubuntu linux.

```
$ sudo apt install -y stow git
```

## Usage

```
$ git clone https://github.com/WIttyJudge/dotfiles
$ cd dotfiles
$ sudo bash setup.sh
```

```
$ git clone https://github.com/WIttyJudge/dotfiles
$ cd dotfiles
$ stow -v -R zsh
```

-v just means verbose so we can see what it is doing. -R tells stow to purge old links first making sure to clean up old references. -t ~ is the target, or where this stow should be installed to. finally, we specify the directory git for what directory we are installing.

After this, restart session.
