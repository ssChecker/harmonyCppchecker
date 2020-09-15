#!/bin/bash
echo "Download cppchecker tool"
wget https://github.com/danmar/cppcheck/archive/2.1.tar.gz
tar -xzvf 2.1.tar.gz

echo "Download Harmonyos source code"
mkdir harmonyos2.0
cd harmonyos2.0
wget https://repo.huaweicloud.com/harmonyos/os/1.0/code-1.0.tar.gz
tar -xzvf code-1.0.tar.gz
cp ../check_cert.sh ./
