#!/bin/bash

DOT_FILES_DIR="$HOME/dotFiles"

rm -r $DOT_FILES_DIR/.config
mkdir $DOT_FILES_DIR/.config

rm -r $DOT_FILES_DIR/bin
mkdir $DOT_FILES_DIR/bin

rm -r $DOT_FILES_DIR/.xmonad/scripts/

bkps=(
    zathura
    fish
    polybar
    rofi
    kitty
    dunst
    gtk*
    )

# To avoid copying plugin generated by packer
mkdir $DOT_FILES_DIR/.config/nvim/
cp $HOME/.config/nvim/init.lua $DOT_FILES_DIR/.config/nvim/init.lua
cp -r $HOME/.config/nvim/lua $DOT_FILES_DIR/.config/nvim/

for name in "${bkps[@]}"; do
    cp -r $HOME/.config/$name $DOT_FILES_DIR/.config/
done

cp $HOME/.xmonad/config.hs $DOT_FILES_DIR/.xmonad/
cp -r $HOME/.xmonad/scripts/ $DOT_FILES_DIR/.xmonad/

bkpsBins=(
    create-flatpak-exe
    delete-flatpak
    install-font
    pfetch
    rm-nvim-swap
)

for name in "${bkpsBins[@]}"; do
    cp $HOME/bin/$name $DOT_FILES_DIR/bin/$name
done

git add . 
if(($#>=1))
then
    git commit -am "$1"
else
    git commit -am "backing up dotFiles"
fi
