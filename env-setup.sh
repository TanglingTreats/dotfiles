#! /usr/bin/env bash

# Sets paths
home_dir=~
proj_dir=$home_dir/dotfiles

printf "Setting up your environment...\n"

# Loops through each entry within project directory that is a dotfile
for entry in "$proj_dir"/.*
do
    # If entry within directory is not a .git, . or .. directory, execute inner statements
    if [ $entry != "$proj_dir/.git" ] && [ $entry != "$proj_dir/." ] && [ $entry != "$proj_dir/.." ]
    then
        # Simplifies entry to the last section of the path
        target=${entry##*/}

        # Checks if target file in home directory is a symlink
        if [ -L "$home_dir/$target" ]
        then
            printf "$target is already present in your home directory\n"
        else
            printf "\nLinking $target\n"

            # Links file/directory within dotfiles to home directory
            ln -s $proj_dir/$target $home_dir/$target

            # Success checks for previous command
            if [ $? -eq 0 ]
            then
                printf "Link successful\n"
            else
                printf "Linking was unsuccessful\n"
            fi
        fi
    fi
done

