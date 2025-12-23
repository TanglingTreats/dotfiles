#!/usr/bin/bash

logpath=~/.config/hypr/scripts/log
logfile=${logpath}/logfile.txt

if [ -f $logfile ]; then
  rm -f $logfile
fi
mkdir -p $logpath
touch $logfile

pipewire_conn_error="connection refused"
pipewire_host_error="host is down"
pipewire_status=$(pactl info 2>&1)

if [[ ${pipewire_status,,} =~ $pipewire_conn_error ]]; then
  pipewire &
  sleep 1
fi

log+="$pipewire_status"


while [ -z "$(ps -e | grep -i wireplumber)" ]
do
  if [[ ! ${pipewire_status,,} =~ $pipewire_conn_error ]] || [[ ! ${pipewire_status,,} =~ $pipewire_host_error ]]; then
    wireplumber &
    pipewire-pulse &
  fi

  pipewire_status=$(pactl info 2>&1)
  log+="$pipewire_status"
done

echo $log >> $logfile

