if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x http_proxy http://172.29.112.1:3128
set -x https_proxy http://172.29.112.1:3128
set -x PATH $PATH:$HOME/.dotnet:$HOME/.dotnet/tools
set -x DOTNET_ROOT $HOME/.dotnet
