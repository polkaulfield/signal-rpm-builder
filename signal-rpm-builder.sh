#!/bin/sh
set -e
DOWNLOAD_URL="$(curl -s https://updates.signal.org/desktop/apt/dists/xenial/main/binary-amd64/Packages.gz | zcat | sed -ne 's_Filename: _https://updates.signal.org/desktop/apt/_p' | sed -e 's:\(.*/\)\([^/][^/]*\):\2\t\1\2:g' | sort -V | cut -f2 | grep -e '/signal-desktop_[^/]*$' | tail -1)"
FILE_NAME="$(echo $DOWNLOAD_URL | cut -d '/' -f 9)"
NAME=$(echo $FILE_NAME | rev | cut -d '_' -f2- | tr '_' '-' | rev)
cd /tmp/
echo [*] Downloading the lastest signal .deb...
wget -O "$FILE_NAME" "$DOWNLOAD_URL"
echo [*] Preparing files with alien to make the rpm package...
sudo alien -r -g -v "$FILE_NAME"
echo [*] Fixing the .spec file with the correct summary...
sudo sed -i 's/Summary:/Summary: signal-desktop/' "$NAME/$NAME"*.spec
cd "$NAME"
echo [*] Building the signal .rpm...
sudo rpmbuild --target=x86_64 --buildroot "$PWD" -bb "$NAME"*.spec
cd /tmp/
echo [*] Installing $NAME.rpm...
sudo rpm -i "$NAME"*.rpm
echo [*] Cleaning up...
sudo rm -r "$NAME" "$FILE_NAME" "$NAME.rpm"
echo [*] Done!
exit 0
