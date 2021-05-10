# termal promt with extra info: git, dir, virtenv# Reference for colors: http://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text

autoload -U colors && colors

# git integration
ZSH_THEME_GIT_PROMPT_PREFIX=", "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{✚ %G%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}%{✖ %G%}"
#ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[yellow]%}%{✻ %G%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[yellow]%}%{·%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{▴%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{▾%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}%{!%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%}%{✔%G%}"

#source $ZPLUG_HOME/repos/woefe/git-prompt.zsh/git-prompt.zsh

setopt PROMPT_SUBST

set_prompt() {
    # PS1 is a special variable that controls what a shell's prompt will look like.
	# [
	PS1="%{$fg[white]%}[%{$reset_color%}"
  # PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
	# Path: http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
	PS1+="%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%}"

	# Status Code
	# PS1+='%(?.., %{$fg[red]%}%?%{$reset_color%})'

	# Git
   # If git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
		#PS1+=', '
		#PS1+="%{$fg[blue]%}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%{$reset_color%}"
		#if [ $(git status --short | wc -l) -gt 0 ]; then
			#PS1+="%{$fg[red]%}+$(git status --short | wc -l | awk '{$1=$1};1')%{$reset_color%}"
		#fi
	#fi

    # Informative git prompt for zsh
    # PS1+=', '
    # PS1+='$(git_super_status)'# for zplug "olivierverdier/zsh-git-prompt"
	  # PS1+='%B%40<..<%~%b$(gitprompt)'
	  PS1+='$(gitprompt)' # woefe/git-prompt.zsh

    if [ ${#VIRTUAL_ENV} -gt 3 ]
    then
        PS1+=','
        PS1+=$'%{$fg[magenta]%}[${VIRTUAL_ENV:t}]%{$reset_color%}'
    else
        venv=$''
    fi
	if [[ ! -z $CONDA_PROMPT_MODIFIER ]]; then
        PS1+=','
        PS1+=$'%{$fg[magenta]%}${CONDA_PROMPT_MODIFIER//[[:blank:]]/}%{$reset_color%}'
    else
        venv=$''
    fi
	# Timer: http://stackoverflow.com/questions/2704635/is-there-a-way-to-find-the-running-time-of-the-last-executed-command-in-the-shel
	#if [[ $_elapsed[-1] -ne 0 ]]; then
		#PS1+=', '
		#PS1+="%{$fg[magenta]%}$_elapsed[-1]s%{$reset_color%}"
	#fi

	# PID
   # if [[ $! -ne 0 ]]; then
		#PS1+=', '
		#PS1+="%{$fg[yellow]%}PID:$!%{$reset_color%}"
	#fi

	# Sudo: https://superuser.com/questions/195781/sudo-is-there-a-command-to-check-if-i-have-sudo-and-or-how-much-time-is-left
   # CAN_I_RUN_SUDO=$(sudo -n uptime 2>&1|grep "load"|wc -l)
	#if [ ${CAN_I_RUN_SUDO} -gt 0 ]
	#then
		#PS1+=', '
		#PS1+="%{$fg_bold[red]%}SUDO%{$reset_color%}"
	#fi

    # end with white ]
	PS1+="%{$fg[white]%}]: %{$reset_color%}% "
}

precmd_functions+=set_prompt

#preexec () {
   #(( ${#_elapsed[@]} > 1000 )) && _elapsed=(${_elapsed[@]: -1000})
   #_start=$SECONDS
#}

#precmd () {
   #(( _start >= 0 )) && _elapsed+=($(( SECONDS-_start )))
   #_start=-1
#}
