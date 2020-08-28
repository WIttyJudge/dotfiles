#          _              
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|
                        
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	docker
	docker-compose
	golang
	httpie

	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

source $HOME/dotfiles/aliases/.aliases
source $HOME/dotfiles/aliases/.functions
