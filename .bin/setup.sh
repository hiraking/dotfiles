sudo apt update

sudo apt install -y git
git config --global core.editor "vim"
git config --global pull.rebase false
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

sudo chsh -s `which fish`

if [ -d ~/.config/fish ]; then 
    echo "overriding exisiting ~/.config/fish directory"
    rm -r ~/.config/fish
fi
echo "~/.config/fish -> ~/dotfiles/.config/fish"
ln -s ~/dotfiles/.config/fish ~/.config/fish

if [ -f ~/.vimrc ]; then
    echo ".vimrc already exists, skipping the ln command."
else
    echo "~/.vimrc -> ~/dotfiles/min_rc.vim"
    ln -s ~/dotfiles/min_rc.vim ~/.vimrc
fi

echo "done"
