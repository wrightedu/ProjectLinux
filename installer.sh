#!/bin/bash

ANACONDA_URL='https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh'
ARDUINO_URL='https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz'

TTY_GROUP='dialout'

echo "Please enter the username for the student: "
read username

adduser --shell '/bin/bash' $username

mkdir /tmp/install/



# Add all of the necessary external repositories
# adobe flash player
add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

apt update

# Install build utils
apt install -y htop make gcc g++ git build-essential 

# Install adobe flash player
apt install -y adobe-flashplugin browser-plugin-freshplayer-pepperflash

# Install adobe reader alternative
apt install -y okular

# Install anaconda
apt install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget $ANACONDA_URL -O /tmp/install/anacondaInstaller.sh
chmod 0755 /tmp/install/anacondaInstaller.sh
runuser -l $username -c 'sh /tmp/install/anacondaInstaller.sh'
rm /tmp/install/anacondaInstaller

# Install arduino
wget $ARDUINO_URL -O /tmp/install/arduino.tar.xz
mkdir /tmp/install/arduino
tar xf /tmp/install/arduino.tar.xz -C /tmp/install/arduino/
runuser -l $username -c 'sh /tmp/install/arduino/install.sh'
usermod -aG $TTY_GROUP $username
rm -rf /tmp/install/arduino/*
rmdir /tmp/install/arduino
rm /tmp/install/arduino.tar.xz

# Install chromium
apt install chromium-browser



