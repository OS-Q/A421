#!/bin/bash
shellPath=`pwd`
BINPath=$HOME/toolchain/SDCC

function set_sdcc()
{
    	if [ ! -d $BINPath ]; then
		mkdir $BINPath
    	fi
    	if [ ! -f $shellPath/sdcc-x64-linux.tar.bz2 ]; then
		cd $shellPath
		wget -O sdcc-x64-linux.tar.bz2 https://excellmedia.dl.sourceforge.net/project/sdcc/snapshot_builds/amd64-unknown-linux2.5/sdcc-snapshot-amd64-unknown-linux2.5-20190728-11328.tar.bz2
    	fi
	if [ ! -d  $BINPath/sdcc/bin ]; then
		tar -xf $shellPath/sdcc-x64-linux.tar.bz2 -C $BINPath
		echo -e "get sdcc bin \n${Line}"   	
	else
		echo -e "exist sdcc folder\n${Line}"
	fi
	if [ -d  $BINPath/sdcc/bin ]; then
		echo 'export PATH='$BINPath'/sdcc/bin:$PATH' >> ~/.bashrc
		source ~/.bashrc
		echo -e "export SDCC path\n${Line}"   	
	fi
}

str="sdcc:   "
ret=`whereis sdcc`
if [ ${#ret} -lt ${#str} ]; then
	set_sdcc
else
	echo -e "have config sdcc bin path \n${Line}"
fi
