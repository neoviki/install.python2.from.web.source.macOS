#!/bin/bash

# -----------------------------------------------------
#
#   Python 2 Installer From Source on Disk ( macOS 10.15.7 )
#
# -----------------------------------------------------
#
#               Author  : Viki @ Vignesh Natarajan
#               Version : v1.0
#
# -----------------------------------------------------


PYTHON_DIR="$HOME/mypy2"
CURR_DIR=`pwd`
sudo ls 1>/dev/null 2>/dev/null

source ./config.sh

if [ $? -ne 0 ]; then
    echo "error: importing config.sh"
    exit 1
fi


echo "Installing Python @ $PYTHON_DIR"

ls $PYTHON_DIR 2>/dev/null 1>/dev/null

if [ $? -eq 0 ]; then
 	 echo " error: installation directory by name - $PYTHON_DIR already exist"
	 echo
	 echo " remove the directory and try again. "
	 echo
	 echo " help:"
	 echo
	 echo "      rm -rf $PYTHON_DIR "
	 echo
	 exit 1
fi

## ZLIB Installation [ S ]

cd zlib-1.2.11 
./configure --prefix=/usr/local/zlib
make
sudo make install

ln -s /usr/local/zlib/include/zconf.h /usr/local/include/
ln -s /usr/local/zlib/include/zlib.h /usr/local/include/


ln -s /usr/local/zlib/lib/libz.a /usr/local/lib/
ln -s /usr/local/zlib/lib/libz.so /usr/local/lib/
ln -s /usr/local/zlib/lib/libz.so.1 /usr/local/lib/
ln -s /usr/local/zlib/lib/libz.so.1.2.11 /usr/local/lib/


ln -s /usr/local/zlib/lib/pkgconfig/zlib.pc /usr/local/lib/pkgconfig/

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH >> $HOME/.bash_profile
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH >>   $HOME/.bash_profile

## ZLIB Installation [ E ]

cd $CURR_DIR
mkdir -p $PYTHON_DIR/source/
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

mkdir -p $PYTHON_DIR/bin/
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

cp -rf $PYTHON_SOURCE_DISK $PYTHON_DIR/source/
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

cd $PYTHON_DIR/source/
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

cd $PYTHON_SOURCE_DISK
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

./configure --prefix=$PYTHON_DIR/bin/
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

make
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

#make test

make install
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

$PYTHON_DIR/bin/bin/python2 --version
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

## Setup Tools Install [S]

cd $CURR_DIR
cd setuptools-44.1.1
$PYTHON_DIR/bin/bin/python2 setup.py install

## Setup Tools Install [S]

echo
echo "Python Location: $PYTHON_DIR/bin/bin/python2"
echo
echo
echo "Python installed successfully"
echo
echo
echo

