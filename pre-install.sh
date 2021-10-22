echo 'Installing Vagrant'
wget https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb
sudo apt install -f ./vagrant_2.2.9_x86_64.deb

echo 'Installing Vagrant plugins'
sudo vagrant plugin install vagrant-proxyconf
sudo vagrant plugin install vagrant-disksize

echo 'Installing virutalbox provider'
sudo apt-get install virtualbox

