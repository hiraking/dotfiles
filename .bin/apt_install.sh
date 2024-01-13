echo "updating ..."
sudo apt update

sudo apt install -y git
git config --global core.editor "vim"
sudo apt install -y python3-dev python3-pip python3-setuptools

sudo apt install -y bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

sudo apt install -y exa
sudo apt install -y fzf
sudo apt install -y ripgrep
sudo apt install -y zoxide

sudo snap install httpie

sudo apt install -y httpie
sudo apt install -y fish

pip3 install thefuck --user
pip3 install tldr --user

echo "done"
