#!/bin/bash

ANACONDA_URL='https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh'
ARDUINO_URL='https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz'
HCS12_URL='http://www.secs.oakland.edu/~llamocca/Courses/ECE470/HCS12%20CPU%20Reference%20Manual_S12CPUV2.pdf'
LC3_URL='http://highered.mheducation.com/sites/dl/free/0072467509/104652/lc3tools_v12.zip'
LOGISIM_URL='https://gigenet.dl.sourceforge.net/project/circuit/2.7.x/2.7.1/logisim-generic-2.7.1.jar'
RSTUDIO_URL='https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.3.959-amd64.deb'

TTY_GROUP='dialout'

APT='apt install -y'

echo "Please enter the username for the student: "
read username

adduser --shell '/bin/bash' $username

mkdir /tmp/install/



# Add all of the necessary external repositories
# adobe flash player
add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

# Racket
add-apt-repository ppa:plt/racket

# VS code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

apt update

# Install build utils
$APT htop make gcc g++ git build-essential 

# Install adobe flash player
$APT adobe-flashplugin browser-plugin-freshplayer-pepperflash

# Install adobe reader alternative
$APT okular

# Install anaconda
$APT libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget $ANACONDA_URL -O /tmp/install/anacondaInstaller.sh
chmod 0755 /tmp/install/anacondaInstaller.sh
runuser -l $username -c 'sh /tmp/install/anacondaInstaller.sh'
rm /tmp/install/anacondaInstaller

# Install arduino
wget $ARDUINO_URL -O /tmp/install/arduino.tar.xz
mkdir /tmp/install/arduino
tar xf /tmp/install/arduino.tar.xz -C /tmp/install/arduino/
sh /tmp/install/arduino/install.sh
runuser -l $username -c 'sh /tmp/install/arduino/install.sh'
usermod -aG $TTY_GROUP $username
rm -rf /tmp/install/arduino
rm /tmp/install/arduino.tar.xz

# Install chromium
apt install chromium-browser

# TODO CodeWarrior/alternative
echo -e "\033[1mTODO: CodeWarrior IDE/alternative\033[0m"

# TODO Crackstation dictionary
echo -e "\033[1mTODO: Download crackstation dictionary\033[0m"

# TODO Cseora
echo -e "\033[1mTODO: Figure out what cseora is\033[0m"

# TODO DeepFreeze
echo -e "\033[1mTODO: DeepFreeze/OverlayRoot\033[0m"

# TODO Install eclipse
echo -e "\033[1mTODO: Eclipse and plugins\033[0m"

# Install filezilla
$APT filezilla

# Install firefox
$APT firefox

# Install freeglut
$APT freeglut3-dev

# Install hashcat
$APT hashcat

# Download the HCS12 manual
# TODO Make sure this is the right file
mkdir -p /home/$username/Desktop
wget $HCS12_URL -O /home/$username/Desktop/HCS12Manual.pdf
echo -e "\033[1mTODO: Verify the manual version\033[0m"


# Install IDLE
#!#!# WARNING #!#!# Cancer!
$APT idle3

# TODO ImgBurn
echo -e "\033[1mTODO: ImgBurn/alternative\033[0m"

# Install jre+jdk
$APT openjdk-11-jre openjdk-11-jdk openjdk-11-doc openjdk-11-dbg

# TODO JMP Pro
echo -e "\033[1mTODO: JMP Pro/alternative\033[0m"

# Install John the Ripper
$APT john

# Install lc3
$APT ddd zip
wget $LC3_URL -O /tmp/install/lc3tools.zip
unzip /tmp/install/lc3tools.zip -d /tmp/install/
pushd /tmp/install/lc3tools
./configure --installdir /usr/bin
make -j8
make install
popd
rm /tmp/install/lc3tools.zip
rm -rf /tmp/install/lc3tools

# TODO Check for a gui
echo -e "\033[1mTODO: Check that there is a gui, add an application\033[0m"

# Install logisim
mkdir /opt/logisim
wget $LOGISIM_URL -O /opt/logism/logisim.jar
chmod 0755 /opt/logism/logisim.jar
echo -e "\033[1mTODO: Add an application\033[0m"

# TODO Matlab
echo -e "\033[1mTODO: Install one-indexed cancer\033[0m"

# Install libreoffice
$APT libreoffice

# Install netbeans
$APT netbeans

# Install Kate (Notepad++ alternative)
$APT kate

# TODO OpNet
echo -e "\033[1mTODO: OpNet?\033[0m"

# PACK
mkdir /home/student/pack
git clone https://github.com/iphelix/pack.git /home/student/pack

# KolourPaint (MS Paint alternative)
$APT kolourpaint

# PyCharm
snap install pycharm-community --classic
# TODO Check pycharm stuff
echo -e "\033[1mTODO: Make sure this is the right version of pycharm\033[0m"
echo -e "\033[1mTODO: FIND SOMETHING BESIDES SNAP\033[0m"

# Yup
$APT python-is-python3


# Install python packages
$APT python3-pip
pip3 install matplotlib numpy scipy cocos2d pandas jupyter seaborn openpyxl xlrd lxml html5lib
runuser -l $username -c "/home/$username/anaconda3/bin/pip install matplotlib numpy scipy cocos2d pandas jupyter seaborn openpyxl xlrd lxml html5lib"

# Install openssh-client (PuTTy alternative)
$APT openssh-client

# TODO QualNet
echo -e "\033[1mTODO: QualNet\033[0m"

# Install Quartus
# TODO Check version
echo -e "\033[1mTODO: Check quartus version\033[0m"
echo -e "\033[1mTODO: Quartus download\033[0m"

# Install r
$APT r-base

# Install r studio
wget $RSTUDIO_URL -O /tmp/install/rstudio.deb
$APT /tmp/install/rstudio.deb
rm /tmp/install/rstudio.deb

# Install racket
$APT racket

# TODO SolidWorks no longer needed?

# TODO SQL developer and SQL modeler
echo -e "\033[1mTODO: SQL developer and SQL modeler\033[0m"

# Install termite
$APT libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev libglib3.0-cil-dev \
    libgnutls28-dev libgirepository1.0-dev libxml2-utils gperf
pushd /tmp/install
git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git
pushd vte-ng
./autogen
make -j8
make install
popd
rm -rf vte-ng
pushd termite
make -j8
make install
ldconfig
popd
rm -rf termite
popd

# Install vscode
$APT code 

# Install vlc
$APT vlc

# TODO VMWare
echo -e "\033[1mTODO: VMWare Player\033[0m"

# Calculator
$APT kcalc

# install wireshark
$APT wireshark

# TODO xampp
echo -e "\033[1mTODO: XAMPP\033[0m"