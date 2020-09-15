#!/bin/bash

# python3 is used.

function check_tools {
       for cmd in $@
       do
            if ! command -v $cmd &> /dev/null
	    then
                echo "$cmd could not be found"
            else
                echo "command $cmd exists"
	    fi
       done
}

function error_msg {
	echo $1
	exit 1
}

check_tools wget tar cmake gcc g++

wget https://github.com/danmar/cppcheck/archive/2.1.tar.gz
tar -xzvf 2.1.tar.gz
cd cppcheck-2.1
mkdir build
cd build
cmake .. || error_msg "cmake config failure!"
cmake --build . || error_msg "Build failure!"
sudo cmake -P cmake_install.cmake || error_msg "Install failure!"
check_tools cppcheck
echo "cppcheck -h , more details"

