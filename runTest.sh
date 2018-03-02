#!/usr/bin/env bash
readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd $DIR;
set -e
set -u
set -o pipefail
standardIFS="$IFS"
IFS=$'\n\t'
echo "
===========================================
$(hostname) $0 $@
===========================================
"

webDirectory="/var/www/vhosts/magento2/"

cp -r ${DIR}/. ${webDirectory}

cd ${webDirectory}

ls -lah


echo "
----------------
$(hostname) $0 completed
----------------
"