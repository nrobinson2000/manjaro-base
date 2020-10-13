#!/bin/bash

# setup.sh
# Script for replicating my Manjaro Cinnamon setup

echo "Install Packages"
sudo pacman-mirrors --country United_States
sudo pacman -Syyu --noconfirm base-devel yay vim plank adapta-gtk-theme albert muparser chromium

echo "Copy autostart apps"
mkdir -p "$HOME/.config/autostart"
APPS="$(find apps/ | tail +2)"
for app in $APPS; do
    cp "$app" "$HOME/.config/autostart"
done

echo "Copy dotfiles"
DOTFILES="$(find dotfiles/ | tail +2)"
for file in $DOTFILES; do
    cp "$file" "$HOME"
done

echo "Apply dconf settings"
dconf load / < "conf/manjaro-blade.conf"

echo "Copy albert.conf"
install -D "conf/albert.conf" "$HOME/.config/albert/albert.conf"