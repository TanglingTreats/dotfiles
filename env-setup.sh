#! /usr/bin/env bash

# Sets paths
proj_dir=$HOME/dotfiles

printf "Setting up your environment...\n"

# Loops through each entry within project directory that is a dotfile
for entry in "$proj_dir"/.*
do
    # If entry within directory is not a .git, . or .. directory, execute inner statements
    if [ $entry != "$proj_dir/.git" ] && [ $entry != "$proj_dir/.gitmodules" ] && [ $entry != "$proj_dir/." ] && [ $entry != "$proj_dir/.." ]
    then
        # Simplifies entry to the last section of the path
        target=${entry##*/}

        # Checks if target file in home directory is a symlink
        if [ -L "$HOME/$target" ]
        then
            printf "$target is already a symlink in your home directory\n"
        else
            if [ -f "$HOME/$target" ]
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
                    rm -i $HOME/$target
                    
                    # Checks if command is ran successfully and the target file does not exist
                    if [ $? -eq 0 ] && [ ! -f "$HOME/$target" ]
                    then
                        printf "\nDelete successful\n"

                        printf "\nLinking $target\n"

                        # Links file/directory within dotfiles to home directory
                        ln -s $proj_dir/$target $HOME/$target

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

            elif [ -d "$HOME/$target" ]
            then
                answer="Y"

                printf "$target already exists in your home directory\n"
                printf "Do you want to delete the directory and create a symlink instead?\nWARNING: The deletion is permanent! Make sure your files have been moved to the appropriate dotfiles folder [Y/n] "
                # Read user input
                read reply

                # If input is empty or null, replace with $answer, else reply remains the same
                reply=${reply:=${answer,,}}

                if [ ${reply,,} = "y" ] 
                then
                    # Deletes file in home directory
                    rm -ri $HOME/$target
                    
                    # Checks if command is ran successfully and the target file does not exist
                    if [ $? -eq 0 ] && [ ! -d "$HOME/$target" ]
                    then
                        printf "\nDelete successful\n"

                        printf "\nLinking $target\n"

                        # Links file/directory within dotfiles to home directory
                        ln -s $proj_dir/$target $HOME/$target

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
            else
                printf "\nLinking $target\n"
                # Link files
                ln -s $proj_dir/$target $HOME/$target

		# Success checks for previous command
		if [ $? -eq 0 ]
		then
		    printf "Link successful\n"

		else
		    printf "Linking was unsuccessful\n"

		fi
            fi
        fi
    fi
done
printf "Installing vim-plug for neovim\n"

if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" ]
then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
else
    printf "vim-plug already exists\n"
fi
printf "Exiting script...\n"

