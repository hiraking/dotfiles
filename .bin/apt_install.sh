sudo apt update

sudo apt install git
sudo apt install python3-dev python3-pip python3-setuptools
sudo apt install bat
sudo apt install exa
sudo apt install fzf
sudo apt install ripgrep
sudo apt install httpie
sudo apt install fish
sudo snap install diff-so-fancy

pip3 install thefuck
pip3 install tldr

git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"
