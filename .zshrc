if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"


# --- Configurações de Histórico ---
HISTFILE="$HOME/.zsh_history"    # Local onde o histórico será salvo
HISTSIZE=10000                   # Quantos comandos manter na sessão atual
SAVEHIST=10000                   # Quantos comandos salvar no arquivo

# Opções para melhorar o comportamento
setopt append_history            # Adiciona ao arquivo em vez de sobrescrever
setopt share_history             # Compartilha o histórico entre abas abertas em tempo real
setopt hist_ignore_dups          # Não salva comandos repetidos seguidos
setopt hist_ignore_space         # Não salva comandos que começam com espaço
setopt hist_reduce_blanks        # Remove espaços em branco desnecessários

#ZSH_THEME="dracula"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Desabilitar a mensagem de configuração
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off


# O plugin de git já é nativo, mas para comandos extras:
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '

source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Inicializar Zoxide
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
eval "$(zoxide init zsh)"


source $ZSH/oh-my-zsh.sh
# bindkey -r '\t'

alias cd="z"
alias n="nvim"
alias c="clear"
alias e="exit"
alias lzd="lazydocker"
alias lzg="lazygit"


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
# source ~/powerlevel10k/powerlevel10k.zsh-theme
ZSH_AUTOSUGGEST_MANUAL_REBIND=1


#. "$HOME/.asdf/completions/asdf.bash"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Carrega o asdf
. "$HOME/.asdf/asdf.sh"

alias dotfiles='git --git-dir=/home/user/.dotfiles/ --work-tree=/home/user'
