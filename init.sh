#!/usr/bin/bash
#
apt-get update -y
apt-get install git cmake ccache python3 ninja-build nasm yasm gawk lsb-release wget software-properties-common gnupg -y
wget https://apt.llvm.org/llvm.sh && bash llvm.sh 16
sudo apt-get install software-properties-common -y
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test -y
