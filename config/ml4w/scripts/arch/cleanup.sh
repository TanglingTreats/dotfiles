#!/bin/bash
clear
aur_helper="$(cat ~/.config/desktop-config/settings/aur.sh)"
figlet -f smslant "Cleanup"
echo
$aur_helper -Scc
