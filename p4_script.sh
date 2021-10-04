#!/bin/bash
sudo apt-get update
sudo apt install git
sudo apt-get install cmake g++ git automake libtool libgc-dev bison flex libfl-dev libgmp-dev libboost-dev libboost-iostreams-dev libboost-graph-dev llvm-6.0-dev pkg-config python-scapy python-ipaddr python-ply python3-pip tcpdump gcc
pip3 install scapy ply
python3 -m pip install --upgrade pip
sudo apt-get install -y doxygen graphviz texlive-full
git clone https://github.com/protocolbuffers/protobuf.git
cd /home/protobuf/  
git checkout v3.6.1
git submodule update --init --recursive
./autogen.sh
./configure
make
make check
sudo make install
sudo ldconfig

cd /home/
git clone --recursive https://github.com/p4lang/p4c.git
cd /home/p4c/ 
mkdir build
cd /home/p4c/build/ 
cmake ..
make -j 4
make -j 4 check
sudo make install

cd /home/
git clone https://github.com/p4lang/behavioral-model.git
cd /home/behavioral-model/ 
./install_deps.sh
python3 -m pip install --upgrade pip
./autogen.sh
./configure 
make
sudo make install
sudo ldconfig
make check
