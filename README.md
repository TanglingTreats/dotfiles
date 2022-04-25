# The dotfiles
The contents in this repository contain aliases and commands that I use to try to optimize my workflow.

As I use this configuration across different devices with different OSes, that is why there are highly specific configurations in place.

## About the Setup Script
The setup script is written to enable minimal setup on a new machine to get things going.

The main point of the script is in creating symbolic links that will allow changes in your own config folders and shell configs.
This will allow easier management in the cloned git repository and thereafter, propagated to other devices.

Take note that this is a bash script and will only work as such. For devices running MacOS, the default bash does not support parameter expansion.
Therefore it is recommended to update it to the latest version (as one should).

To run the script, simply navigate into this project folder and \
```./env-script.sh```

This will do a few things:
1. Prompt for deleting any existing zsh config files to replace it with the one in the repository.
2. Create soft symbolic links for files mentioned above from the home folder in your home directory.
3. Create symbolic links for folders in the config folder in your own .config directory.

Thus, any changes made externally will be reflected in the repository.

This is how I managed to get set up quickly for my needs but feel free to change it up!

Enjoy!
