# Packages

## Generate

Generate the list of explicitly installed official Arch Linux packages:

```bash
pacman -Qein | awk -F': ' '/^Name/{name=$2} /^Version/{ver=$2} /^Description/{desc=$2; printf "%-30s %-15s %s\n", name, ver, desc}' > pkg/arch-pacman.txt
```

Generate the list of explicitly installed AUR packages:

```bash
pacman -Qeim | awk -F': ' '/^Name/{name=$2} /^Version/{ver=$2} /^Description/{desc=$2; printf "%-30s %-15s %s\n", name, ver, desc}' > pkg/arch-aur.txt
```

Generate the list of explicitly installed Homebrew packages on MacOS:

```bash
MAC_PACKAGE=~/dotfiles/pkg/mac-brew.txt; rm "$MAC_PACKAGE" && brew bundle dump --file="$MAC_PACKAGE"
```

## Install

Install the official Arch Linux packages from the list:

```bash
awk '{print $1}' ~/dotfiles/pkg/arch-pacman.txt | sudo pacman -S --needed -
```

Install the AUR packages for the list:

```bash
awk '{print $1}' ~/dotfiles/pkg/arch-aur.txt | yay -S --needed -
```

Install the Brew packages from the list:

```bash
brew bundle --file="$HOME/dotfiles/pkg/mac-brew.txt"
```
