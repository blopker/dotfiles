#!/usr/bin/env bash 
 
function pause(){ 
   read -p "$*" 
} 

APT="sudo apt-get"

sudo add-apt-repository -y ppa:keepassx/daily 
$APT update 
$APT install -y nautilus-dropbox keepassx git 
 
echo "Now pull your SSH key into .ssh" 
pause 'Press [Enter] key to continue...' 
 
chmod 600 ~/.ssh/id_rsa 

echo "Installing extra fun stuff..."
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:chris-lea/node.js
$APT update -y
$APT upgrade -y
$APT install -y vim build-essential nodejs sublime-text guake chromium-browser zsh curl wget default-jdk

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

chsh -s /bin/zsh

echo "Cloning dotfiles..."
git clone https://github.com/blopker/dotfiles.git ~/.dotfiles

echo "Done!"
