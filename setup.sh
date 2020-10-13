sudo pacman-mirrors --country United_States
sudo pacman -Syyu --noconfirm base-devel yay vim plank adapta-gtk-theme albert muparser


APPS="$(find apps/ | tail +2)"

for app in "$APPS"; do
    cp "$app" "$HOME/.config/autostart"
done

DOTFILES="$(find dotfiles/ | tail +2)"

for file in "$DOTFILES"; do
    cp "$file" "$HOME"
done