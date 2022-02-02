#!/bin/bash

# -----------------------------------------------------
#
#   Python 2 Installer From Source on Disk ( macOS 10.15.7 )
#
# -----------------------------------------------------
#
#               Author  : Natan @ Vignesh Natarajan
#               Version : v1.0
#
# -----------------------------------------------------


PYTHON_DIR="$HOME/mypy2"

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

echo
echo "Python Location: $PYTHON_DIR/bin/bin/python2"
echo
echo
echo "Python installed successfully"
echo
echo
echo

