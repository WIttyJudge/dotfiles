# Packages

## Generate

Generate the list of explicitly installed official Arch Linux packages:

```bash
pacman -Qein | awk -F': ' '/^Name/{name=$2} /^Version/{ver=$2} /^Description/{desc=$2; printf "%-30s %-15s %s\n", name, ver, desc}' > pkg/pacman-packages.txt
```

Generate the list of explicitly installed AUR packages:

```bash
pacman -Qeim | awk -F': ' '/^Name/{name=$2} /^Version/{ver=$2} /^Description/{desc=$2; printf "%-30s %-15s %s\n", name, ver, desc}' > pkg/aur-packages.txt
```

Generate the list of explicitly installed Homebrew packages on MacOS:

```bash
MAC_PACKAGE=~/dotfiles/pkg/mac-brew.txt; rm "$MAC_PACKAGE" && brew bundle dump --file="$MAC_PACKAGE"
```

## Install

Install the official Arch Linux packages from the list:

```bash
awk '{print $1}' ~/dotfiles/pkg/pacman-packages.txt | sudo pacman -S --needed -
```

Install the AUR packages for the list:

```bash
awk '{print $1}' ~/dotfiles/pkg/aur-packages.txt | yay -S --needed -
```
