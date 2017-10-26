set -e

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln .vimrc ~/.vimrc
vim +PluginInstall +qall

ln .ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe/
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

echo "Installation finished!"
