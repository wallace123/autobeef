sudo apt-get update && sudo apt-get -y full-upgrade
sudo apt install -y vim curl net-tools
git clone https://github.com/beefproject/beef
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
apt list --upgradable
sudo apt -y upgrade
cd beef
./install
sed -i 's/passwd: "beef"/passwd: "abc123"/g' ./config.yaml
./beef
