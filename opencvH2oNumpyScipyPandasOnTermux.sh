#!/bin/bash -       
#title           :opencv.sh for CPU use only (non-GPU)
#description     :This script install alll required dependecies for video analytics on termux for android,
#                 script has been tested on a oneplus 7 pro 8GB version device
#author		     :Manoj Kumar Das
#date            :2019/07/02
#version         :0.1    
#usage		     :sh opencvH2oNumpyScipyPandasOnTermux.sh
#==============================================================================
#To enable storage access run below command
# termux-setup-storage
pkg update
apt-get --assume-yes upgrade 
apt-get --assume-yes install curl nano gnupg coreutils gnupg wget man screen htop git


# Make the sources.list.d directory
mkdir -p $PREFIX/etc/apt/sources.list.d
# Write the needed source file
if apt-cache policy | grep -q "https://dl.bintray.com/termux/termux-packages-24" ; then
echo "deb https://its-pointless.github.io/files/24 termux extras" > $PREFIX/etc/apt/sources.list.d/pointless.list
else
echo "deb https://its-pointless.github.io/files/ termux extras" > $PREFIX/etc/apt/sources.list.d/pointless.list
fi
# Download signing key from https://its-pointless.github.io/pointless.gpg 
wget https://its-pointless.github.io/pointless.gpg
apt-key add pointless.gpg

# Update apt
apt update

apt-get --assume-yes install openblas libllvm clang cmake libjpeg-turbo-dev
apt-get --assume-yes install python python-dev fftw libzmq libzmq-dev freetype freetype-dev 
apt-get --assume-yes install libpng libpng-dev pkg-config libgmp-dev libmpc-dev libmpfr-dev
apt-get --assume-yes install scipy zlib zlib-dev gcc-8 libgfortran-8 julia
pip3.7 install -U pip
pip3.7 install -U setuptools
pip3.7 install -U wheel
pip3.7 install -U pep517
pip3.7 install -U numpy 
pip3.7 install -U pandas
pip3.7 install -U Cython
pip3.7 install scikit-learn==0.19.2
pip3.7 install -U matplotlib
pip3.7 install -U xarray
pip3.7 install -U redis
pip3.7 install -U sqlalchemy
pip3.7 install -U ipython
pip3.7 install -U jupyter
pip3.7 install -U gmpy2
pip3.7 install -U pymysql
pip3.7 install -U h2o

git clone https://github.com/opencv/opencv
cd opencv
mkdir build && cd build
LDFLAGS=" -llog -lpython3" cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_opencv_python3=on -DBUILD_opencv_python2=off -DWITH_QT=OFF -DWITH_GTK=OFF ..
make
make install
