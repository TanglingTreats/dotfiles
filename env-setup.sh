#! /usr/bin/env bash

home_dir=~/
proj_dir=$home_dir/dotfiles

printf "Setting up your environment...\n"

for entry in "$proj_dir"/.*
do
    if [ $entry != "$proj_dir/.git" ] && [ $entry != "$proj_dir/." ] && [ $entry != "$proj_dir/.." ]
    then
        target=${entry##*/}

        if [ -L "$home_dir/$target" ]
        then
            printf "$target is already present in your home directory\n"
        else
            printf "\nLinking $target\n"
            ln -s $proj_dir/$target $home_dir/$target
            if [ $? -eq 0 ]
            then
                printf "Link successful\n"
            else
                printf "Linking was unsuccessful\n"
            fi
        fi
    fi
done

