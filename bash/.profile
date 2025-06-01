# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# PS1 customization with Advanced Git Prompt
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[$(tput setaf 8)\](\t) \[$(tput sgr0)\][\[$(tput setaf 13)\]\u\[$(tput setaf 13)\]@\[$(tput setaf 13)\]\h\[$(tput setaf 11)\]${PS1_CMD1} \[$(tput setaf 10)\]\W\[$(tput sgr0)\] ]$ '

# Check for changes in .dotfiles repository
$HOME/.dotfiles/bash/.check_git_status

export LANG=en_US.UTF-8
