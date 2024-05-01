###----------------The God zshrc-----------------------###

###--------------------LOADING ENGINE-----------------###
autoload -U colors && colors
autoload -U compinit
autoload -U vcs_info
precmd () { vcs_info }
setopt autocd
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments
setopt PROMPT_SUBST


###-----------------------History File & Size-----------###
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

###--------------Tab Completion---------------###
zstyle ':completion:*' menu select

# Auto complete with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# Fomattting vcs info message
zstyle ':vcs_info:*' formats '%F{magenta}%f %F{yellow}%b%f'
zmodload zsh/complist
compinit
_comp_options+=(globdots)


###--------Aliasrc File----------------###
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

###----------------Prompt--------------###

# git dirty function 
function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf " ["; fi
  if echo "${STATUS}" | grep -c "renamed:"         &> /dev/null; then printf " >"; else printf ""; fi
  if echo "${STATUS}" | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo "${STATUS}" | grep -c "new file::"       &> /dev/null; then printf " +"; else printf ""; fi
  if echo "${STATUS}" | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo "${STATUS}" | grep -c "modified:"        &> /dev/null; then printf " *"; else printf ""; fi
  if echo "${STATUS}" | grep -c "deleted:"         &> /dev/null; then printf " -"; else printf ""; fi
  printf " ]"
}

PS1="%B%{$fg[blue]%}󰣇  %B%{$fg[magenta]%}%~%B%{$fg[red]%} %{$reset_color%}%b "
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
RPS1='%b${vcs_info_msg_0_}%B%{$fg[blue]%}$(parse_git_dirty)%{$reset_color%}%b'

###--------------------Pretty Sudo Prompt---------------------###
export SUDO_PROMPT="$fg[red][sudo] $fg[yellow]password for $USER  :$fg[white]"

###-----------------------Vim mode--------------------###
bindkey -v
export KEYTIMEOUT=1


###------------Cursor Shapes For Different Vim Mode------###

###-------Cursor style cheat sheet------------###
# Set cursor style (DECSCUSR), VT520.
# 0  ⇒  blinking block.
# 1  ⇒  blinking block (default).
# 2  ⇒  steady block.
# 3  ⇒  blinking underline.
# 4  ⇒  steady underline.
# 5  ⇒  blinking bar, xterm.
# 6  ⇒  steady bar, xterm.



function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;  #block
        viins|main) echo -ne '\e[5 q';; #beam
    esac
}
zle -N zle-keymap-select
zle-line-init(){
    zle -K viins # initiate vi insert as keymap (can be removed if 'bindkey -v' has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup
preexec() { echo -ne '\e[5 q' ;} # USE beam shape cursor for each new prompt

###-------------Using  Vim Keys--------------------------###
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history 
bindkey -v '^?' backward-delete-char


###--------------------Autostart-------------------###
colorscript -r

###-----------------------Plugins-----------------------###
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null




export PATH=$PATH:/home/bugs/.spicetify
