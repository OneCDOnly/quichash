#!/usr/bin/env bash
############################################################################
# quichash-launch.sh
#	Copyright 2026 OneCD
#
# Contact:
#	one.cd.only@gmail.com
#
# Description:
#	This is the launcher script for the 'quichash' QPKG
#
# Available in the MyQNAP store:
#	https://www.myqnap.org/product/
#
# And via the sherpa package manager:
#	https://git.io/sherpa
#
# QPKG source:
#   https://github.com/OneCDOnly/quichash
#
# Application source:
#   https://github.com/vyrti/quichash
#
# Community forum:
#	https://community.qnap.com/
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see http://www.gnu.org/licenses/
############################################################################

readonly r_install_path=$(/sbin/getcfg quichash Install_Path -f /etc/config/qpkg.conf)
	readonly r_bin_pathfile=$r_install_path/hash.bin
	readonly r_lib_path=$r_install_path/lib
		readonly r_linker_pathfile=$r_lib_path/ld-linux-armhf.so.3

# This intermediate script exists only to ensure the binary launches with the included linker.

if [[ -e $r_bin_pathfile ]]; then
	LD_LIBRARY_PATH=$r_lib_path/ $r_linker_pathfile $r_bin_pathfile "$@"
else
	echo "error: unable to find 'quichash' binary!"
	exit 1
fi

exit 0
