#!/bin/bash

# setup.sh
# Script for replicating my Manjaro Cinnamon setup

echo "Installng packages..."
sudo pacman-mirrors --country United_States
sudo pacman -Syyu --noconfirm base-devel yay vim plank adapta-gtk-theme albert muparser chromium

echo "Copying autostart apps..."
mkdir -p "$HOME/.config/autostart"
APPS="$(find apps/ | tail +2)"
for app in $APPS; do
    cp "$app" "$HOME/.config/autostart"
done

echo "Copying dotfiles..."
DOTFILES="$(find dotfiles/ | tail +2)"
for file in $DOTFILES; do
    cp "$file" "$HOME"
done

echo "Applying dconf settings..."
dconf load / < "conf/manjaro-blade.conf"

echo "Copying albert.conf..."
install -D "conf/albert.conf" "$HOME/.config/albert/albert.conf"
