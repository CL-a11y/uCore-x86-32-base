# Makefile
  
SHELL := /bin/bash

DOCKER_NAME ?= uCore-x86-32-Base
DIR := workplace


test: test1 test2

lab1: test3

lab2: test4

lab3: test5

lab4: test6 test7

lab5: test8


test1:
	git submodule init
	git submodule update

test2:
	git submodule init
	git submodule update
	
test3:
	git submodule init
	git submodule update

test4:
	git submodule init
	git submodule update
	
test5:
	git submodule init
	git submodule update

test6:
	git submodule init
	git submodule update
	
test7:
	git submodule init
	git submodule update
	
test8:
	git submodule init
	git submodule update


clean:
	rm -rf ${DIR}

# for local ubuntu with zsh shell SHELL, need root for sudo 
ubuntu_setenv: gcc
	sudo apt install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev \
              gawk build-essential bison flex texinfo gperf libtool patchutils bc \
              zlib1g-dev libexpat-dev pkg-config  libglib2.0-dev libpixman-1-dev git tmux python3 ninja-build zsh -y
	cd .. && wget https://download.qemu.org/qemu-7.0.0.tar.xz
	cd .. && tar xvJf qemu-7.0.0.tar.xz
	cd ../qemu-7.0.0 && ./configure --target-list=i386-softmmu,i386-linux-user
	cd ../qemu-7.0.0 && make -j$(nproc)
	cd ../qemu-7.0.0 && sudo make install
	qemu-system-i386 --version
	qemu-i386 --version

# for github codespaces ubuntu with zsh SHELL, need root for sudo
codespaces_setenv: gcc
	sudo apt install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev \
              gawk build-essential bison flex texinfo gperf libtool patchutils bc \
              zlib1g-dev libexpat-dev pkg-config  libglib2.0-dev libpixman-1-dev git tmux python3 ninja-build zsh -y
	cd .. && wget https://download.qemu.org/qemu-7.0.0.tar.xz
	cd .. && tar xvJf qemu-7.0.0.tar.xz
	cd ../qemu-7.0.0 && ./configure --target-list=i386-softmmu,i386-linux-user
	cd ../qemu-7.0.0 && make -j$(nproc)
	cd ../qemu-7.0.0 && sudo make install
	qemu-system-i386 --version
	qemu-i386 --version

gcc:
	echo "deb http://dk.archive.ubuntu.com/ubuntu/ xenial main" >> /etc/apt/sources.list
	echo "deb http://dk.archive.ubuntu.com/ubuntu/ xenial universe" >> /etc/apt/sources.list
	sudo apt update
	sudo apt install -y gcc-4.8