#Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"

#Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

#Enabling Globstar
shopt -s globstar

#Programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Color Prompts
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#Colored Prompt
PS1='\[\e[35;1m\]\u\[\e[97m\]@\[\e[35m\]\h\[\e[22m\] \[\e[97;1m\]\w\[\e[0;35m\] \[\e[97;1m\]\$\[\e[0m\] '

#Be paranoid
alias cp='cp -ip'
alias mv='mv -i'
alias rm='rm -i'

#My own aliases
alias ls='ls -FlAh --color' #Manually setting color here because it can be a bit weird sometimes
alias history='fc -l'
alias vim='nvim'
alias refresh='clear && fastfetch'
alias svim='sudo nvim'

#Typos
alias sl='ls'

#Package Management
alias pip='pip --user'
alias flatpak='flatpak'
alias full-update="sudo bash -c 'emaint --auto sync && sudo emerge --update --deep --newuse @world && sudo emerge --depclean'"
alias emerge='sudo emerge'
alias dispatch-conf='sudo dispatch-conf'

#Power Management
alias reboot='sudo reboot'
alias shutdown='sudo poweroff'
alias poweroff='sudo poweroff'

#Launch into WM/DE first
if [ -n "$WAYLAND_DISPLAY" ] || [ -n "$DISPLAY" ]; then
    if [ -z "$TMUX" ]; then
        true #tmux
    fi
    refresh
else
    start-hyprland
fi
