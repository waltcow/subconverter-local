#https://github.com/tindy2013/subconverter/releases/tag/v0.9.0

#!/bin/bash
set -e
set -o pipefail
# set -x
#cd /tmp
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    ARCH="amd64"
elif [ "$ARCH" = "aarch64" ]; then
    ARCH="arm64"
elif [[ "$ARCH" == "armv7"* || "$ARCH" == "armv6l" ]]; then
    ARCH="armhf"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi      
VERSION="v0.9.0"
FILENAME="subconverter-linux-${ARCH}.tar.gz"
URL="https://github.com/tindy2013/subconverter/releases/download/${VERSION}/${FILENAME}"
wget -q $URL -O /tmp/$FILENAME
tar -xzf /tmp/$FILENAME -C /usr/local/bin
rm -f /tmp/$FILENAME
if [ ! -f /usr/local/bin/subconverter ]; then
    echo "subconverter installation failed!"
    exit 1
fi
