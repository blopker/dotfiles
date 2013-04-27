# Download and extract
wget --output-document eclipse.tar.gz http://www.eclipse.org/downloads/download.php\?file\=/technology/epp/downloads/release/juno/SR2/eclipse-java-juno-SR2-linux-gtk-x86_64.tar.gz\&r\=1
tar -xvf eclipse.tar.gz
mv eclipse ~/

# Make app launchers work
mkdir -p ~/.local/share/applications/
cp -f eclipse.desktop ~/.local/share/applications/  

# Symlink to a directory in my PATH
mkdir -p ~/bin
ln -sf ~/eclipse/eclipse ~/bin/eclipse

# Clean up
rm eclipse.tar.gz
