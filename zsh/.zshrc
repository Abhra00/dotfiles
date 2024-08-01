#  ┏┳┓┓     ┏┓      ┏┓ ┓    
#   ┃ ┣┓┏┓  ┏┛┏┓┏┓  ┏┛┏┣┓┏┓┏
#   ┻ ┛┗┗   ┗┛┗ ┛┗  ┗┛┛┛┗┛ ┗
#                           


#╔═╗┌─┐┬ ┬┬─┐┌─┐┬┌┐┌┌─┐  ┌┬┐┬ ┬┌─┐  ┌─┐┬┌┐┌┬┌┬┐  ┌─┐┬  ┬ ┬┌─┐┬┌┐┌
#╚═╗│ ││ │├┬┘│  │││││ ┬   │ ├─┤├┤   ┌─┘│││││ │   ├─┘│  │ ││ ┬││││
#╚═╝└─┘└─┘┴└─└─┘┴┘└┘└─┘   ┴ ┴ ┴└─┘  └─┘┴┘└┘┴ ┴   ┴  ┴─┘└─┘└─┘┴┘└┘
source "${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git/zinit.zsh"

#╔═╗┌─┐┌┐┌  ┌─┐┬ ┬┌┬┐┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐
#╔═╝├┤ │││  └─┐│ │ │││ │  ├─┘├┬┘│ ││││├─┘ │ 
#╚═╝└─┘┘└┘  └─┘└─┘─┴┘└─┘  ┴  ┴└─└─┘┴ ┴┴   ┴ 
export SUDO_PROMPT="$fg[red][sudo] $fg[yellow]password for $USER  :$fg[white]"

#  ╔═╗┬  ┬ ┬┌─┐┬┌┐┌┌─┐
#  ╠═╝│  │ ││ ┬││││└─┐
#  ╩  ┴─┘└─┘└─┘┴┘└┘└─┘
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

#  ╔═╗┌┐┌┬┌─┐┌─┐┌─┐┌┬┐┌─┐
#  ╚═╗││││├─┘├─┘├┤  │ └─┐
#  ╚═╝┘└┘┴┴  ┴  └─┘ ┴ └─┘
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

#  ╔═╗┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
#  ║  │ ││││├─┘│  ├┤  │ ││ ││││└─┐
#  ╚═╝└─┘┴ ┴┴  ┴─┘└─┘ ┴ ┴└─┘┘└┘└─┘
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)
zinit cdreplay -q

#  ╔═╗┬ ┬┌┬┐┌─┐  ┌─┐┬ ┬┌─┐┌─┐┌─┐┌─┐┌┬┐┬┌─┐┌┐┌  ┌─┐┌─┐┌┬┐┌┬┐┬┌┐┌┌─┐┌─┐
#  ╠═╣│ │ │ │ │  └─┐│ ││ ┬│ ┬├┤ └─┐ │ ││ ││││  └─┐├┤  │  │ │││││ ┬└─┐
#  ╩ ╩└─┘ ┴ └─┘  └─┘└─┘└─┘└─┘└─┘└─┘ ┴ ┴└─┘┘└┘  └─┘└─┘ ┴  ┴ ┴┘└┘└─┘└─┘
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#fdf6e2"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)



#  ╦  ╦┬┌┬┐┌┐ ┬┌┐┌┌┬┐
#  ╚╗╔╝││││├┴┐││││ ││
#   ╚╝ ┴┴ ┴└─┘┴┘└┘─┴┘
bindkey -v
export KEYTIMEOUT=1

#Cursor Shapes For Different Vim Mode
#Cursor style cheat sheet
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

bindkey '^j' history-search-backward
bindkey '^k' history-search-forward
bindkey '^[w' kill-region
bindkey '^y' autosuggest-accept
bindkey -v '^?' backward-delete-char



#  ╦ ╦┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
#  ╠═╣│└─┐ │ │ │├┬┘└┬┘
#  ╩ ╩┴└─┘ ┴ └─┘┴└─ ┴ 
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTDUP=erase

#  ╔═╗┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
#  ║ ║├─┘ │ ││ ││││└─┐
#  ╚═╝┴   ┴ ┴└─┘┘└┘└─┘
setopt PROMPT_SUBST 
setopt MENU_COMPLETE
setopt LIST_PACKED		   
setopt AUTO_LIST
setopt COMPLETE_IN_WORD  
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#  ╔═╗┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┬┌─┐┌┐┌┌─┐  ╔═╗┌┬┐┬ ┬┬  ┌─┐
#  ║  │ ││││├─┘│  ├┤  │ ││ ││││└─┐  ╚═╗ │ └┬┘│  ├┤ 
#  ╚═╝└─┘┴ ┴┴  ┴─┘└─┘ ┴ ┴└─┘┘└┘└─┘  ╚═╝ ┴  ┴ ┴─┘└─┘
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=48;5;197;1'
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'
zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'


#  ╦ ╦┌─┐┬┌┬┐┬┌┐┌┌─┐  ╔╦╗┌─┐┌┬┐┌─┐
#  ║║║├─┤│ │ │││││ ┬   ║║│ │ │ └─┐
#  ╚╩╝┴ ┴┴ ┴ ┴┘└┘└─┘  ═╩╝└─┘ ┴ └─┘
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots

#  ╔═╗┌─┐┌┐┌  ╔═╗┬─┐┌─┐┌┬┐┌─┐┌┬┐
#  ╔═╝├┤ │││  ╠═╝├┬┘│ ││││├─┘ │ 
#  ╚═╝└─┘┘└┘  ╩  ┴└─└─┘┴ ┴┴   ┴ 
function dir_icon {
  if [[ "$PWD" == "$HOME" ]]; then
    echo "%B%F{cyan}%f%b"
  else
    echo "%B%F{cyan}%f%b"
  fi
}
PS1='%B%F{green}%f%b  %B%F{magenta}%n%f%b $(dir_icon)  %B%F{red}%~%f%b${vcs_info_msg_0_} %(?.%B%F{green}.%F{red})%f%b '



#  ╔═╗┬  ┬┌─┐┌─┐┌─┐┌─┐
#  ╠═╣│  │├─┤└─┐├┤ └─┐
#  ╩ ╩┴─┘┴┴ ┴└─┘└─┘└─┘
alias cat="bat --theme=base16"
alias ls='eza --icons=always --color=always -a'
alias ll='eza --icons=always --color=always -la' 
alias vim='nvim'
alias c='clear'
alias stu='xrdb $HOME/.config/x11/xresources && pidof st | xargs kill -s USR1'

#  ╔═╗┬ ┬┌─┐┬  ┬    ╦┌┐┌┌┬┐┌─┐┌─┐┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
#  ╚═╗├─┤├┤ │  │    ║│││ │ ├┤ │ ┬├┬┘├─┤ │ ││ ││││
#  ╚═╝┴ ┴└─┘┴─┘┴─┘  ╩┘└┘ ┴ └─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘
eval "$(zoxide init --cmd cd zsh)"
