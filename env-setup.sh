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
            printf "$target is already a symlink in your home directory\n"
        else
            if [ -f "$home_dir/$target" ]
            then
                answer="Y"

                printf "$target already exists in your home directory\n"
                printf "Do you want to delete the file and create a symlink instead? The deletion is permanent! [Y/n] "
                # Read user input
                read reply

                # If input is empty or null, replace with $answer, else reply remains the same
                reply=${reply:=${answer,,}}

                if [ ${reply,,} = "y" ] 
                then
                    # Deletes file in home directory
                    rm -i $home_dir/$target
                    
                    # Checks if command is ran successfully and the target file does not exist
                    if [ $? -eq 0 ] && [ ! -f "$home_dir/$target" ]
                    then
                        printf "\nDelete successful\n"

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
                    else
                        printf "Delete failed!\n"

                    fi

                elif [ ${reply,,} = "n" ]
                then
                    printf "No changes have been made to $target\n"

                else
                    printf "\nInvalid input detected\n"
                fi
            fi
        fi
    fi
done
printf "Exiting script...\n"

