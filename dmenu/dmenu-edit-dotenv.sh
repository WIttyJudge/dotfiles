#!/usr/bin/env bash

files=(
	bashrc
	gitconfig
	i3config
	neofetchconfig
)

file_choise="$(printf '%s\n' "${files[@]}" | dmenu -i -p "Edit dotenv file:" )"

case "$file_choise" in
	quit)
		echo "Program terminated." && exit 1
	;;

	bashrc)
		file_choise="~/dotfiles/bash/.bashrc"
	;;

	gitconfig)
		file_choise="~/dotfiles/git/.gitconfig"
	;;

	*)
		exit 1
	;;
esac

editors=(
	vim
	vscode
)

editor_choise="$(printf '%s\n' "${editors[@]}" | dmenu -i -p "Editor: " )"

case "$editor_choise" in
	vim)
		sudo vim $file_choise
	;;

	vscode)
		code --add $file_choise
	;;

	*)
		exit 1
	;;
esac