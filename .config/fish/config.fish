if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH $PATH:$HOME/.dotnet:$HOME/.dotnet/tools
set -x PATH $PATH:$HOME/.local/bin
set -x DOTNET_ROOT /usr/share/dotnet

thefuck --alias | source

# abbr
abbr -a -U -- apti 'sudo apt install -y'
abbr -a -U -- aptr 'sudo apt remove'
abbr -a -U -- aptu 'sudo apt update'

abbr -a -U -- ga 'git add'
abbr -a -U -- gc 'git commit'
abbr -a -U -- gca 'git commit --amend'
abbr -a -U -- gco 'git checkout'
abbr -a -U -- gd 'git diff'
abbr -a -U -- gf 'git fetch'
abbr -a -U -- gp 'git push'
abbr -a -U -- gst 'git status'

abbr -a -U -- cat bat
abbr -a -U -- la 'exa -a'
abbr -a -U -- ll 'exa -la --icons'
abbr -a -U -- ls exa

abbr -a -U -- sconf 'source ~/.config/fish/config.fish'
abbr -a -U -- vconf 'vim ~/.config/fish/config.fish'

abbr -a -U -- qemu '~/osbook/devenv/run_qemu.sh ~/edk2/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi ~/workspace/mikanos/kernel/kernel.elf'

# at the end of config
zoxide init fish | source
