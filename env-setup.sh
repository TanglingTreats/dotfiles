#! /usr/bin/env bash

home_dir=~/
proj_dir=$home_dir/dotfiles

echo "Setting up your environment...\n"

echo "Linking .zshrc file\n"
ln -s $proj_dir/.zshrc $home_dir/

echo "\nLink done\n"
echo "Linking .vim directory...\n"

ln -s $proj_dir/.vim $home_dir/
echo "\nLink done"

