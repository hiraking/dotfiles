# .zshrc
autoload -U promptinit; promptinit
prompt pure

setopt no_beep

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

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

alias vim='nvim'
alias v='nvim'
alias clip='pbcopy'
alias m='man'

alias ls='ls -G'
alias ll='ls -alG'
alias la='ls -aG'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias dot='cd ~/dotfiles'
alias zshrc='nvim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias historyall='history -E 1'
alias psa='ps aux'

alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'

alias code='cd ~/Desktop/AtCoder'
alias g++='g++ -std=c++17 -I/Users/hiraking/Desktop/AtCoder'
alias rr='g++ main.cpp -std=c++17 -I/Users/hiraking/Desktop/AtCoder && ./a.out'
alias pyr='python3 main.py'
alias c='cat main.cpp | pbcopy'
alias pyc='cat main.py | pbcopy'

alias -g C='| pbcopy'
alias -g G='| grep --color=auto'
alias -g H='| head'
alias -g T='| tail'
alias -g L='| less -R'
