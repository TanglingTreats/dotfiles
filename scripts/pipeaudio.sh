#!/usr/bin/zsh

# Grab first line of pipewire process and remove the first space in the result
result=${$(ps -A | grep -i -m 1 pipewire)# *}

# Remove the rest of the string except the pid
pid=${result%% *}

# Check that pid exists
if [ $pid -ne '' ]
then
  # No need to do anything
  echo "Process exists: $pid"
elif
then
  # Restart pipewire and other processes; Assumes everything is running from the beginning
  echo "No audio processes found. Starting audio server."
  pipewire & disown
  sleep 1
  pipewire-pulse & disown
  wireplumber & disown
fi

