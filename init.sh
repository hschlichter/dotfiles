#!/usr/bin/env bash
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles ~/.vim
git submodule init
git submodule update
