#  ┏┳┓┓     ┏┓      ┏┓ ┓    
#   ┃ ┣┓┏┓  ┏┛┏┓┏┓  ┏┛┏┣┓┏┓┏
#   ┻ ┛┗┗   ┗┛┗ ┛┗  ┗┛┛┛┗┛ ┗
#                           

                                                           

#Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Sourcing the zinit plugin
source "${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git/zinit.zsh"

# The zenful prompt
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# Pretty Sudo Prompt
export SUDO_PROMPT="$fg[red][sudo] $fg[yellow]password for $USER  :$fg[white]"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Using vim keybind
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


# Keybinds
bindkey '^j' history-search-backward
bindkey '^k' history-search-forward
bindkey '^[w' kill-region
bindkey '^y' autosuggest-accept
bindkey -v '^?' backward-delete-char

# History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Aliases
alias ls='ls --color'
alias lt='tree'
alias vim='nvim'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

