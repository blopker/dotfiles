APT="sudo apt-get"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:keepassx/daily
$APT update -y
$APT upgrade -y
$APT install -y vim git build-essential sublime-text guake keepassx chromium-browser zsh curl wget default-jdk

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

chsh -s /bin/zsh

git clone https://github.com/blopker/dotfiles.git ~/.dotfiles
