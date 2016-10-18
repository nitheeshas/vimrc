set -e

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

ln .vimrc ~/.vimrc
vim +PluginInstall +qall

echo "Installation finished!"
