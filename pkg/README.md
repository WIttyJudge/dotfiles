# Packages

## Generate

1. Generate the list of explicitly installed official Arch Linux packages:

```bash
pacman -Qein | awk -F': ' '/^Name/{name=$2} /^Version/{ver=$2} /^Description/{desc=$2; printf "%-30s %-15s %s\n", name, ver, desc}' > pkg/pacman-packages.txt
```

2. Generate the list of explicitly installed AUR packages:

```bash
pacman -Qeim | awk -F': ' '/^Name/{name=$2} /^Version/{ver=$2} /^Description/{desc=$2; printf "%-30s %-15s %s\n", name, ver, desc}' > pkg/aur-packages.txt
```

3. Generate the list of explicitly installed AUR packages:

```bash
MAC_PACKAGE=~/dotfiles/pkg/mac-brew.txt; rm "$MAC_PACKAGE" && brew bundle dump --file="$MAC_PACKAGE"
```

## Install

3. Install the official Arch Linux packages from the list:

```bash
awk '{print $1}' ~/dotfiles/pkg/pacman-packages.txt | sudo pacman -S --needed -
```

4. Install the AUR packages for the list:

```bash
awk '{print $1}' ~/dotfiles/pkg/aur-packages.txt | yay -S --needed -
```
