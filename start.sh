#!/bin/bash
sudo pacman -S neofetch htop tmux neovim firefox alacritty zsh xf86-input-libinput light xorg-xsetroot redshift playerctl ranger scrot pavucontrol base-devel openssh acpi lxsession feh bluez bluez-utils xclip dunst npm udiskie $(sudo pacman -Ssq ttf-)

ssh-keygen -t rsa

# keyboard, touchpad, amd configs files
sudo mv ./xorg.conf.d/* /etc/X11/xorg.conf.d/

# move .config to /home/
cp -rf .config/ ~
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# move .xinitrc to /home/
mv .xinitrc ~j

# oh-my-zsh config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
mv -f .zshrc ~

# move wallpapper to /home/ and set it 
mv wp.png ~ && feh --bg-center ~/wp.png

#delete dotfiles
rm -rf ../dotfiles/

# install dwm
cd ~/.config/dwm/ && make && sudo make install

echo "Done!"
