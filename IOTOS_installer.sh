#!/bin/sh

echo "██╗ ██████╗ ████████╗ ██████╗ ███████╗"
echo "██║██╔═══██╗╚══██╔══╝██╔═══██╗██╔════╝"
echo "██║██║   ██║   ██║   ██║   ██║███████╗"
echo "██║██║   ██║   ██║   ██║   ██║╚════██║"
echo "██║╚██████╔╝   ██║██╗╚██████╔╝███████║"
echo "╚═╝ ╚═════╝    ╚═╝╚═╝ ╚═════╝ ╚══════╝"


LIST_OF_APPS="libftdi-dev libcurl3-dev minicom binwalk git python3 python3-dev python-pip python3-pip build-essential automake autoconf libtool \
    git unzip python-dev texinfo make pkg-config wireshark zsh curl wget zlib1g-dev liblzma-dev python-magic tcpdump \
    gdb gdb-multiarch unrar libssl-dev libx32gcc-4.8-dev libc6-dev-i386 binutils-arm-linux-gnueabi vim qt4-qmake\
    binutils-arm-linux-gnueabi libffi-dev libc6-powerpc-cross libc6-mipsel-cross binutils-powerpc-linux-gnu screen afl libfontconfig1 \
    mesa-common-dev libglu1-mesa-dev qt5-default qtwebengine5-dev qtpositioning5-dev libqt5svg5-dev libqt5xmlpatterns5-dev cmake android-tools-adb \
    android-tools-fastboot kdiff3"
PYTHON3_MODULES="scapy capstone unicorn ropper retdec-python twitter pandoc keystone-engine testresources pysimplesoap"
PYTHON2_MODULES="dpkt-fix capstone unicorn keystone-engine ropper twitter testresources pysimplesoap"

echo "---------------------------------------"
echo "Installer starting...."
echo "---------------------------------------"

sudo apt-get update -y
sudo apt-get install $LIST_OF_APPS -y

sudo dpkg --add-architecture i386
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install libncurses5:i386 libc6-dbg:i386 libc6-i686:i386 libexpat1:i386 libffi6:i386 libfontconfig1:i386 libfreetype6:i386 libgcc1:i386 libglib2.0-0:i386 \
 libice6:i386 libpcre3:i386 libsm6:i386 libstdc++6:i386 libuuid1:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxdmcp6:i386 libxext6:i386 libxrender1:i386 zlib1g:i386 \
 libx11-xcb1:i386 libdbus-1-3:i386 libxi6:i386 libsm6:i386 libcurl3:i386 -y

sudo pip3 -H install $PYTHON3_MODULES
sudo pip -H install $PYTHON2_MODULES
sudo pip install --upgrade pip
sudo pip install --upgrade pwntools
sudo pip3 install --upgrade pip

sudo apt-get install curl cmake -y

mkdir GIT && cd GIT

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)
sudo apt-get install ttf-ancient-fonts fonts-powerline -y
wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme && mv bullet-train.zsh-theme ~/.oh-my-zsh/themes/

wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run && chmod +x qt-unified-linux-x64-online.run && sudo ./qt-unified-linux-x64-online.run sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

git clone https://github.com/fkie-cad/FACT_core.git && ./FACT_core/install.py
git clone https://github.com/devttys0/baudrate.git
git clone https://github.com/JonathanSalwan/ROPgadget.git && sudo python3 ROPgadget/setup.py install
git clone https://github.com/radare/radare2.git && ./radare2/sys/install.sh
git clone --recurse-submodules https://github.com/radareorg/cutter && cd cutter && ./build.sh && cd ..
git clone https://github.com/rampageX/firmware-mod-kit.git
git clone https://github.com/jondonas/linux-exploit-suggester-2.git
git clone https://github.com/eblot/pyspiflash.git py_SPIFlash
git clone https://github.com/pwndbg/pwndbg.git && ./pwndbg/setup.sh
git clone https://github.com/skylot/jadx. && ./jadx/gradlew dist
git clone https://github.com/rc0r/afl-utils.git && cd afl-utils && sudo python setup.py install && cd ..
echo "source /usr/local/lib/python2.7/dist-packages/exploitable-1.32_rcor-py2.7.egg/exploitable/exploitable.py" >> ~/.gdbinit
git clone https://git.code.sf.net/p/openocd/code openocd-code && cd openocd-code && ./bootstrap && ./configure && make && sudo make install && cd ..
git clone https://www.github.com/threat9/routersploit && cd routersploit && sudo python3 -m pip install -r requirements.txt

wget https://cdn.ikalogic.com/dist/scanastudio/package/ScanaStudio.tar.bz2 && tar -xvjf ScanaStudio.tar.bz2 && ./ScanaStudio/install.sh
wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.3.3.jar && mv apktool_2.3.3.jar apktool.jar && chmod +x apktool* && sudo mv apktool* /usr/local/bin
curl https://portswigger.net/burp/releases/download\?product\=community\&version\=1.7.33\&type\=linux > burp_install.sh && chmod +x burp_install.sh && ./burp_install.sh
sudo add-apt-repository universe
sudo apt-get install libglib2.0-dev && sudo python3 -m pip install bluepy

wget https://out7.hex-rays.com/files/idafree70_linux.run && chmod +x idafree70_linux.run && ./idafree70_linux.run..
wget https://download.jetbrains.com/python/pycharm-professional-2018.1.2.tar.gz &&  tar -zxvf pycharm-professional-2018.1.2.tar.gz -C ~/
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text -y


echo "---------------------------------------"
echo "Installer finished...."
echo "Hopefully everything went okay...! ;)"
echo "---------------------------------------"


echo "alias rcutter='~/GIT/cutter/build/Cutter'" >> ~/.zshrc
echo "alias pycharm='~/pycharm-2018.1.2/bin/pycharm.sh'" >> ~/.zshrc
echo "alias scana='~/Ikalogic/ScanaStudio/ScanaStudio'" >> ~/.zshrc
echo "alias ida='~/idafree-7.0/ida64'" >> ~/.zshrc
echo "alias rsf='python3 ~/GIT/routersploit/rsf.py'" >> ~/.zshrc
echo "alias jadx='~/GIT/jadx/build/jadx/bin/jadx'" >> ~/.zshrc
echo "source ~/.zshrc"
echo "-----------------------------------------------"
echo "The following aliases were added to the .zshrc"
echo "radare2 Cutter GUI --------------------> rcutter"
echo "pycharm IDE ---------------------------> pycharm"
echo "ScanaStudio ---------------------------> scana"
echo "IDA Disassembler ----------------------> ida"
echo "Routersploit --------------------------> rsf"
echo "jadx ----------------------------------> jadx"
echo "-----------------------------------------------"


echo "---------------------------------------------------------------------"
echo "!! Please logout and back in to make all changes work accordingly !!"
echo "---------------------------------------------------------------------"



