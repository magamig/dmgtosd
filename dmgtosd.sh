#! /bin/bash

#    DMG to SD restore [OSX] 
#    
#    Copyright (C) 2015 magamig
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

if [ `id -u` -ne 0 ]
then
  echo "Please start this script with root privileges!"
  echo "Try again with sudo."
  exit 0
fi

if [ "$(uname)" == "Darwin" ]; then
	echo "###########################################"
	echo "###	DMG to SD card - restore	###"
	echo -e "###########################################\n"

	read -p "Path to DISK: (example: /dev/disk2): `echo $'\n> '`" DISK
	echo "Path to DMG file: (example: /Users/Bob/Desktop/foo.dmg)"
	read -p "Path to DMG file: (example: /Users/Bob/Desktop/foo.dmg): `echo $'\n> '`" DMG

	echo "Copying "$DMG" to "$DISK
	mkdir /.dmgtosd
	hdiutil convert $DMG -format UDTO -o /.dmgtosd/bar.img
	mv /.dmgtosd/bar.img.cdr /.dmgtosd/bar.img
	clear
	diskutil umountDisk $DISK
	sleep 1
	clear
	pv -p -e -r -t -r /.dmgtosd/bar.img | dd of=$DISK
	sleep 1
	rm -r /.dmgtosd
	echo ""
	
	echo "Success. Everythind is complete!"
	exit 0
else
	echo "This script is designed for OS X only."
	exit 0
fi
