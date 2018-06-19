#!/bin/bash -       
#title           :opencv.sh for CPU use only (non-GPU)
#description     :This script install alll required dependecies for video analytics on ubuntu 16.04,
#			      opencv 3.3 is compiled with ffmpeg and including extra libraries coming from contrib
#author		     :Manoj Kumar Das
#date            :2018/05/29
#version         :0.1    
#usage		     :sh opencv.sh <your sudo user password>
#notes           :Install Vim and Emacs to use this script.
#bash_version    :4.3.48(1)-release
#==============================================================================

myPassowrd=""
if [ "$1" != "" ]
then
myPassowrd=$1
cd ~/
sudo -S $myPassword apt-get update 
sudo -S $myPassword apt-get dist-upgrade -y
sudo -S $myPassword apt-get autoremove -y
sudo -S $myPassword apt-get upgrade
sudo -S $myPassword add-apt-repository ppa:jonathonf/ffmpeg-3 -y
sudo -S $myPassword apt-get update
sudo -S $myPassword apt-get install build-essential -y
sudo -S $myPassword apt-get install ffmpeg -y
sudo -S $myPassword apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y
sudo -S $myPassword apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev -y
sudo -S $myPassword apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
sudo -S $myPassword apt-get install libxvidcore-dev libx264-dev -y
sudo -S $myPassword apt-get install libgtk-3-dev -y
sudo -S $myPassword apt-get install libatlas-base-dev gfortran -y
sudo -S $myPassword apt-get install qt-sdk -y
sudo -S $myPassword apt-get install python2.7-dev python3.5-dev -y
sudo -S $myPassword apt-get install libmysqlclient-dev
sudo -S $myPassword apt-get install tesseract-ocr -y
sudo -S $myPassword apt-get install tesseract-ocr-eng
sudo -S $myPassword apt-get install tesseract-ocr-ell
sudo -S $myPassword apt-get install mysql-server
sudo -S $myPassword wget https://bootstrap.pypa.io/get-pip.py
sudo -S $myPassword python get-pip.py

sudo -S $myPassword pip install -U pip
sudo -S $myPassword pip install -U numpy
sudo -S $myPassword pip install -U pandas
sudo -S $myPassword pip install -U matplotlib
sudo -S $myPassword pip install -U scipy
sudo -S $myPassword pip install -U scikit-image
sudo -S $myPassword pip install -U mysql-python
sudo -S $myPassword pip install -U sklearn
sudo -S $myPassword pip install -U sqlalchemy
sudo -S $myPassword pip install -U psycopg2
sudo -S $myPassword pip install -U ipython
sudo -S $myPassword pip install -U jupyter
sudo -S $myPassword pip install -U redis
sudo -S $myPassword pip install -U ipywidgets
sudo -S $myPassword pip install -U sklearn
sudo -S $myPassword pip install -U scipy
sudo -S $myPassword pip install pyocr

wget https://github.com/opencv/opencv_contrib/archive/3.3.1.zip
wget https://github.com/opencv/opencv/archive/3.3.0.zip

unzip opencv.zip
unzip opencv_contrib.zip

mkdir -p ~/opencv-3.3.0/build/
cd ~/opencv-3.3.0/build/
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.3.0/modules \
	-D WITH_V4L=ON \
	-D WITH_QT=ON \
	-D WITH_GDAL=ON \
	-D WITH_XINE=ON \
	-D WITH_FFMPEG=ON \
    -D BUILD_EXAMPLES=ON ..

make -j $(($(nproc) + 1))
sudo -S $myPassword make install
sudo -S $myPassword /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo -S $myPassword ldconfig
sudo -S $myPassword apt-get update
sudo -S $myPassword reboot
fi
