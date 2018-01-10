#!/bin/bash

# adjust settings for a specific user
USERNAME='someuser'

# basic packages
apt-get update && apt-get upgrade
apt-get install -y apt-utils
apt-get install -y sudo vim vim-common git screen bash-completion build-essential htop tree man-db

# shell and user
cp -rv etc/bash.bashrc.local /etc/
cp -rv etc/vim/vimrc.local /etc/vim/
cp -rv etc/screenrc /etc/
cp -rv etc/bash.bashrc /tmp
cat /tmp/bash.bashrc >> /root/.bashrc
cat /tmp/bash.bashrc >> /home/${USERNAME}/.bashrc

# git and vim
cp -rv home/.gitconfig /root/
cp -rv home/.gitconfig /home/${USERNAME}/
cp -rv home/.vimrc /root/
cp -rv home/.vim /root/.vim/
cp -rv home/.vimrc /home/${USERNAME}/
cp -rv home/.vim /home/${USERNAME}/.vim/

# pull in Vundle vim packages
git clone https://github.com/vim-scripts/ctrlp.vim.git /home/${USERNAME}/.vim/bundle/ctrlp.vim
git clone https://github.com/vim-scripts/The-NERD-tree.git /home/${USERNAME}/.vim/bundle/The-NERD-tree
git clone https://github.com/vim-airline/vim-airline.git /home/${USERNAME}/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git /home/${USERNAME}/.vim/bundle/vim-airline-themes
git clone https://github.com/airblade/vim-gitgutter.git /home/${USERNAME}/.vim/bundle/vim-gitgutter
git clone https://github.com/VundleVim/Vundle.vim.git /home/${USERNAME}/.vim/bundle/Vundle.vim
cp -vr /home/${USERNAME}/.vim /root/

# fix final group management and file permissions
usermod --groups adm,sudo,audio,video,staff,games,users ${USERNAME}
chown -R ${USERNAME}: /home/${USERNAME}/
chown -R root: /root

# cleanup
apt-get autoremove
apt-get clean
apt-get purge
