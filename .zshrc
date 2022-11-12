# .zshrc
autoload -U promptinit; promptinit
prompt pure

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

setopt no_beep
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/hiraking/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/hiraking/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/hiraking/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/hiraking/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧をカラー表示
autoload colors
zstyle ':completion:*' list-colors ''

# コマンドのスペルを訂正
setopt correct

alias ls='ls -G'
alias ll='ls -alG'
alias run='g++ main.cpp&&./a.out'
alias notebook='/Users/hiraking/opt/anaconda3/bin/jupyter_mac.command'
