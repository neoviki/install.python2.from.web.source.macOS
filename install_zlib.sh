cd zlib-1.2.11
./configure --prefix=/usr/local/zlib
make
sudo make install


 export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH >> $HOME/.bash_profile
 export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH >>   $HOME/.bash_profile
