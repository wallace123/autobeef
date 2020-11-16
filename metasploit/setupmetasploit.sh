sudo apt-get update && sudo apt-get -y full-upgrade
sudo apt install -y vim curl net-tools
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/6.0.15/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

