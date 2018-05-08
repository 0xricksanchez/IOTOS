#!/bin/sh

echo "██╗ ██████╗ ████████╗ ██████╗ ███████╗"
echo "██║██╔═══██╗╚══██╔══╝██╔═══██╗██╔════╝"
echo "██║██║   ██║   ██║   ██║   ██║███████╗"
echo "██║██║   ██║   ██║   ██║   ██║╚════██║"
echo "██║╚██████╔╝   ██║██╗╚██████╔╝███████║"
echo "╚═╝ ╚═════╝    ╚═╝╚═╝ ╚═════╝ ╚══════╝"


LIST_OF_APPS="curl minicom binwalk git python-pip python3-pip python3 python3-dev build-essential automake autoconf libtool libcurl3 \
    git unzip python-dev texinfo make pkg-config wireshark zsh curl wget zlib1g-dev liblzma-dev python-magic tcpdump \
    gdb gdb-multiarch unrar libssl-dev libx32gcc-4.8-dev libc6-dev-i386 binutils-arm-linux-gnueabi vim qt4-qmake\
    binutils-arm-linux-gnueabi libffi-dev libc6-powerpc-cross libc6-mipsel-cross binutils-powerpc-linux-gnu screen afl libfontconfig1 \
mesa-common-dev libglu1-mesa-dev qt5-default qtwebengine5-dev qtpositioning5-dev libqt5svg5-dev libqt5xmlpatterns5-dev cmake"
PYTHON3_MODULES="scapy capstone unicorn ropper retdec-python twitter pandoc keystone-engine testresources pysimplesoap"
PYTHON2_MODULES="dpkt-fix capstone unicorn keystone-engine ropper twitter testresources pysimplesoap"

echo "---------------------------------------"
echo "Installer starting...."
echo "---------------------------------------"

sudo apt-get autoremove -y
sudo apt-get update -y
sudo apt-get install $LIST_OF_APPS -y

sudo dpkg --add-architecture i386
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install libncurses5:i386 libc6-dbg:i386 libc6-i686:i386 libexpat1:i386 libffi6:i386 libfontconfig1:i386 libfreetype6:i386 libgcc1:i386 libglib2.0-0:i386 \
 libice6:i386 libpcre3:i386 libsm6:i386 libstdc++6:i386 libuuid1:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxdmcp6:i386 libxext6:i386 libxrender1:i386 zlib1g:i386 \
 libx11-xcb1:i386 libdbus-1-3:i386 libxi6:i386 libsm6:i386 libcurl3:i386 -y

sudo pip3 install $PYTHON3_MODULES
sudo pip install $PYTHON2_MODULES
sudo pip install --upgrade pip
sudo pip install --upgrade pwntools
sudo pip3 install --upgrade pip



mkdir GIT && cd GIT
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run && chmod +x qt-unified-linux-x64-online.run && sudo ./qt-unified-linux-x64-online.run sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
wget https://raw.githubusercontent.com/0x00rick/IOTOS/master/install.py
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
wget https://download.jetbrains.com/python/pycharm-professional-2018.1.2.tar.gz &&  tar -zxvf pycharm-professional-2018.1.2.tar.gz -C ~/
git clone https://github.com/fkie-cad/FACT_core.git && sudo cp install.py FACT_core/ && ./FACT_core/install.py
git clone https://github.com/devttys0/baudrate.git
git clone https://github.com/JonathanSalwan/ROPgadget.git && sudo python3 ROPgadget/setup.py install
git clone https://github.com/radare/radare2.git && ./radare2/sys/install.sh
git clone --recurse-submodules https://github.com/radareorg/cutter && cd cutter && ./build.sh && cd ..
git clone https://github.com/rampageX/firmware-mod-kit.git
git clone https://github.com/jondonas/linux-exploit-suggester-2.git les2
git clone https://github.com/eblot/pyspiflash.git py_SPIFlash
git clone https://github.com/pwndbg/pwndbg.git && cd pwndbg && ./setup.sh
wget https://out7.hex-rays.com/files/idafree70_linux.run && chmod +x idafree70_linux.run && ./idafree70_linux.run..
git clone https://github.com/rc0r/afl-utils.git && cd afl-utils && sudo python setup.py install && cd ..
echo "source /usr/local/lib/python2.7/dist-packages/exploitable-1.32_rcor-py2.7.egg/exploitable/exploitable.py" >> ~/.gdbinit
git clone https://git.code.sf.net/p/openocd/code openocd-code && cd openocd-code && ./bootstrap && ./configure && make && sudo make install && cd ..
wget https://cdn.ikalogic.com/dist/scanastudio/package/ScanaStudio.tar.bz2 && tar -xvjf ScanaStudio.tar.bz2 && ./ScanaStudio/install.sh
sudo add-apt-repository universe
git clone https://www.github.com/threat9/routersploit && cd routersploit && sudo python3 -m pip install -r requirements.txt
sudo apt-get install libglib2.0-dev && sudo python3 -m pip install bluepy && cd ..


rm qt-opensource-linux-x64-5.10.1.run ScanaStudio.tar.bz2 pycharm-professional-2018.1.2.tar.gz idafree70_linux.run

echo "---------------------------------------"
echo "Installer finished...."
echo "Hopefully everything went okay...! ;)"
echo "---------------------------------------"


echo "alias rCutter='~/GIT/cutter/build/Cutter'" >> ~/.zshrc
echo "alias pycharm='~/pycharm-2018.1.2/bin/pycharm.sh'" >> ~/.zshrc
echo "alias scana='~/Ikalogic/ScanaStudio/ScanaStudio'" >> ~/.zshrc
echo "alias ida='~/idafree-7.0/ida64'" >> ~/.zshrc
echo "alias rsf='python3 ~/GIT/routersploit/rsf.py'" >> ~/.zshrc
echo "source ~/.zshrc"
echo "-----------------------------------------------"
echo "The following aliases were added to the .zshrc"
echo "radare2 Cutter GUI --------------------> rCutter"
echo "pycharm IDE ---------------------------> pycharm"
echo "ScanaStudio ---------------------------> scana"
echo "IDA Disassembler ----------------------> ida"
echo "Routersploit ----------------------> rsf"
echo "-----------------------------------------------"



