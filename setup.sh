#!/bin/bash

# setup.sh
# Script for replicating my Manjaro Cinnamon setup

# Install Packages
sudo pacman-mirrors --country United_States
sudo pacman -Syyu --noconfirm base-devel yay vim plank adapta-gtk-theme albert muparser

# Copy autostart apps
APPS="$(find apps/ | tail +2)"
for app in $APPS; do
    cp "$app" "$HOME/.config/autostart"
done

# Copy dotfiles
DOTFILES="$(find dotfiles/ | tail +2)"
for file in $DOTFILES; do
    cp "$file" "$HOME"
done
