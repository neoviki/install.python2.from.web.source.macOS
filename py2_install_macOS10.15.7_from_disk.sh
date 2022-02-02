#Python2 Install

PYTHON_DIR="$HOME/mypy2"

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

cp -rf Python-2.7.9 $PYTHON_DIR/source/
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

cd $PYTHON_DIR/source/
[ $? -ne 0 ] && { echo "error line ( ${LINENO} )"; exit 1; }

cd Python-2.7.9
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

