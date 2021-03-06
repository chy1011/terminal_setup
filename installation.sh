#! /bin/bash

cur_dir=$(pwd)

echo "========================="
echo "Installation of neofetch"
echo "========================="

git clone https://github.com/dylanaraps/neofetch
cd neofetch
mv Makefile Makefile.bkup
sed 's/usr/usr\/local/' Makefile.bkup > Makefile
sudo make install
cd .. && rm -rf neofetch

echo "============================="
echo "Installation of powerlevel10k"
echo "============================="

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

ln -s -f $cur_dir/dotfiles/p10k.zsh ~/.p10k.zsh

echo "============================"
echo "Installation of zsh-plugins"
echo "============================"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

ln -s -f $cur_dir/dotfiles/zshrc ~/.zshrc

echo "===================="
echo "Installation of tmux"
echo "===================="

if brew ls --versions tmux > /dev/null; then
	# The package is installed
	ln -s -f $cur_dir/dotfiles/tmux.conf ~/.tmux.conf
else
	# The package is not installed
	brew install tmux

	ln -s -f $cur_dir/dotfiles/tmux.conf ~/.tmux.conf
fi

