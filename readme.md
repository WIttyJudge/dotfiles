![Dotfiles](github-assets/dotfiles-logo.png)

I manage my dotfiles currently for Arch Linux machine.
[The XDG Base Directory Specification](https://wiki.archlinux.org/title/XDG_Base_Directory) was followed as much as possible.

## Tools I use a lot

List of all tools I install by default on any Arch Linux machines could be found in the [packages.csv](https://github.com/WIttyJudge/dotfiles/blob/master/packages.csv) file.
I have an ansible script which iterates over this file, therefore then installs all the tools.

## Configs list

(\*) - Tools I use.

| Type                    | Program                                                                                                               |
| :---------------------- | :-------------------------------------------------------------------------------------------------------------------- |
| App Launcher            | [dmenu](https://github.com/WIttyJudge/suckless-tools) (\*) / [rofi](https://github.com/davatorium/rofi)               |
| Hotkey Daemon           | [sxhkd](https://github.com/baskerville/sxhkd)                                                                         |
| Image Viewer            | [nsxiv](https://github.com/nsxiv/nsxiv)                                                                               |
| Notification Daemon     | [dunst](https://github.com/dunst-project/dunst)                                                                       |
| Shell                   | [zsh](https://wiki.archlinux.org/index.php/zsh)                                                                       |
| Status Bar              | [dwmblocks](https://github.com/WIttyJudge/suckless-tools) (\*) / [polybar](https://github.com/polybar/polybar)        |
| Screenshot Tool         | [Custom script](https://github.com/WIttyJudge/dotfiles/blob/master/scripts/.local/bin/make-screenshot)                |
| System Information Tool | [Custom script](https://github.com/WIttyJudge/dotfiles/blob/master/scripts/.local/bin/ufetch)                         |
| Terminal                | [alacritty](https://github.com/alacritty/alacritty) (\*) / [urxvt](https://wiki.archlinux.org/index.php/rxvt-unicode) |
| Text Editor             | [neovim](https://github.com/neovim/neovim)                                                                            |
| Window Manager          | [dwm](https://github.com/WIttyJudge/suckless-tools) (\*) / [i3](https://wiki.archlinux.org/index.php/i3)              |
| Terminal Multiplexer    | [tmux](https://github.com/tmux/tmux/wiki)                                                                             |

All configs will be symlinked to `~/.config/` folder.
Useful scripts stored in `~/.local/bin` folder and symlinked to `~/.local/bin` folder.
Environment variables have been set in `.zprofile` file.

## Setup

Everything you need to do is just to execute the setup script.
It only loops through all the config files and symlinks them.

```bash
~/dotfiles
$ bash setup
```

## Screenshots

..

## Notes

- The ~/.zprofile file MUST be in the $HOME directory, however, the rest of the zsh config files live in ~/.config/zsh/.
- I highly recommend you do not copy these dotfiles. If you want to use them, read through them and understand how they work. Then take the parts of them that are relevant to your workflow.
