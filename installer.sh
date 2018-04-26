#!/bin/sh

echo "██╗ ██████╗ ████████╗ ██████╗ ███████╗"
echo "██║██╔═══██╗╚══██╔══╝██╔═══██╗██╔════╝"
echo "██║██║   ██║   ██║   ██║   ██║███████╗"
echo "██║██║   ██║   ██║   ██║   ██║╚════██║"
echo "██║╚██████╔╝   ██║██╗╚██████╔╝███████║"
echo "╚═╝ ╚═════╝    ╚═╝╚═╝ ╚═════╝ ╚══════╝"


LIST_OF_APPS="minicom binwalk git python-pip python3-pip python3 python3-dev build-essential automake autoconf libtool git unzip python-dev texinfo make pkg-config wireshark zsh curl wget zlib1g-dev liblzma-dev python-magic tcpdump dig gdb gdb-multiarch unrar libssl-dev libx32gcc-4.8-dev libc6-dev-i386 binutils-arm-linux-gnueabi libc6-arm-cross binutils-arm-linux-gnueabi libffi-dev libc6-powerpc-cross libc6-mipsel-cross binutils-powerpc-linux-gnu nohup screen"
PYTHON3_MODULES="scapy capstone keystone-engine unicorn ropper retdec-python sqlite3 twitter"
PYTHON2_MODULES="angr capstone unicorn keystone-engine ropper sqlite3 twitter retdec-python"

echo "---------------------------------------"
echo "Installer starting...."
echo "---------------------------------------"

sudo apt-get autoremove -y
sudo apt-get update -y && sudo apt-get install $LIST_OF_APPS -y
sudo pip3 install $PYTHON3_MODULES
sudo pip install $PYTHON2_MODULES
sudo pip install --upgrade pip
pip install --upgrade pwntools
sudo pip3 install --upgrade pip



mkdir GIT && cd GIT
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/fkie-cad/FACT_core.git && sudo cp install.py FACT_core/ && ./FACT_core/install.py
git clone https://github.com/devttys0/baudrate.git
git clone https://github.com/JonathanSalwan/ROPgadget.git && sudo python3 ROPgadget/setup.py install
git clone https://github.com/radare/radare2.git && ./radare2/sys/install.sh
git clone --recurse-submodules https://github.com/radareorg/cutter && cd cutter && /build.sh && cd ..
git clone https://git.code.sf.net/p/openocd/code openocd-code && cd openocd-code && ./bootstrap && ./configure && make && sudo make install && cd ..
git clone https://github.com/rampageX/firmware-mod-kit.git
git clone https://github.com/eblot/pyspiflash.git py_SPIFlash
git clone https://github.com/pwndbg/pwndbg.git && cd pwndbg && ./setup.sh
wget https://out7.hex-rays.com/files/idafree70_linux.run && chmod +x idafree70_linux.run && ./idafree70_linux.run
wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz && tar -zxvf afl-latest.tgz
dir=$(ls | egrep "afl-[0-9]") && cd $dir && make && sudo make install && cd ..
git clone https://github.com/rc0r/afl-utils.git && sudo ./afl-utils python setup.py install

wget https://cdn.ikalogic.com/dist/scanastudio/package/ScanaStudio.tar.bz2 && tar -xvjf ScanaStudio.tar.bz2 && ./ScanaStudio/install.sh

rm afl-latest.tgz ScanaStudio.tar.bz2


sudo dpkg --add-architecture i386
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install libc6:i386 libc6-dbg:i386 libncurses5:i386 libstdc++6:i386 -y


echo "---------------------------------------"
echo "Installer finished...."
echo "Hopefully everything went okay...! ;)"
echo "---------------------------------------"




