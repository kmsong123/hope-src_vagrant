#!/bin/bash

echo "Running dependencies install script..."

sudo apt-get update

sudo apt-get install -y make vim sudo autoconf automake autogen autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf iverilog libelf-dev socat expat libexpat1-dev git python3 python3-setuptools cmake ninja-build clang haskell-platform haskell-stack binutils-dev python3-distutils python3-pytest python3-pytest-xdist python3-pytest-timeout python3-pyelftools git automake autoconf libtool g++ cmake libboost-dev libboost-program-options-dev libyaml-cpp-dev libgflags-dev python3-psutil xterm verilator virtualenv python3-pip libftdi1-2 libusb-1.0-0-dev libtinfo5 libglib2.0-dev libpixman-1-dev pkg-config device-tree-compiler ninja-build python-pytest

sudo -H pip3 install --upgrade pip
sudo -H pip3 install pytest-html
sudo -H pip3 install pytest-timeout

sudo apt-get upgrade -y python-pytest

#install all python dependencies
sudo -H pip3 install -r /home/vagrant/vagrant_shared/python_requirements.txt

echo "source ~/hope-src/tools/isp-support/set-env" >> ~/.bashrc

