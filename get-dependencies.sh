#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
# pacman -Syu --noconfirm PACKAGESHERE

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
echo "Maing nightly build of DOSBox Pure Unleashed..."
echo "---------------------------------------------------------------"
git clone https://github.com/schellingb/dosbox-pure-unleashed
git clone https://github.com/schellingb/dosbox-pure
git clone https://github.com/schellingb/ZillaLib

mkdir -p ./AppDir/bin
cd dosbox-pure-unleashed
make linux-release ZL_VIDEO_OPENGL_CORE=1 -j
mv -v Release-linux/DOSBoxPure_x86_64 ./AppDir/bin
