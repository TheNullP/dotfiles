if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="dracula"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Desabilitar a mensagem de configuração
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
eval "$(zoxide init zsh)"

source $ZSH/oh-my-zsh.sh
bindkey -r '\t'

alias cd="z"
alias n="nvim"
alias c="clear"
alias e="exit"
alias lzd="lazydocker"
alias lzg="lazygit"

bindkey '^I' expand-or-complete
# O valor 0 indica que o turbo boost está ativo, e 1 que ele está desativado.
alias onturbo="echo '0' | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo"
alias offturbo="echo '1' | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo"
alias statusturbo="cat /sys/devices/system/cpu/intel_pstate/no_turbo"


export TERMINAL="alacritty"
export FLYCTL_INSTALL="/home/marcos/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"


imwheel -k -b "8 9"
c #LIMPA O TERMINAL

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Iniciar tmux automaticamente
[ -z "$TMUX" ] && exec tmux
alias dotfiles='git --git-dir=/home/marcos/.dotfiles/ --work-tree=/home/marcos'
# source ~/powerlevel10k/powerlevel10k.zsh-theme
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

. "$HOME/.asdf/asdf.sh"

. "$HOME/.asdf/completions/asdf.bash"
