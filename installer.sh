#!/bin/bash

ANACONDA_LINK='https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh'

# Add all of the necessary external repositories
# adobe flash player
add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

apt update

# Install build utils
apt install htop make gcc g++ git build-essential 

# Install adobe flash player
apt install adobe-flashplugin browser-plugin-freshplayer-pepperflash

# Install adobe reader alternative
apt install okular

# Install anaconda
apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget $ANACONDA_LINK -O /tmp/anacondaInstaller.sh
chmod 0755 /tmp/anacondaInstaller.sh
echo -n 'Enter a username to install anaconda for: '
read username
runuser -l $username -c 'sh /tmp/anacondaInstaller.sh'
rm /tmp/anacondaInstaller
