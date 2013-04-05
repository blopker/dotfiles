APT="sudo apt-get"
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo add-apt-repository ppa:gophers/go
sudo add-apt-repository ppa:a-v-shkop/chromium
$APT update
$APT upgrade
$APT install vim git build-essential sublime-text golang-stable guake keepass2 chromium-browser zsh curl wget synapse

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

chsh -s /bin/zsh
