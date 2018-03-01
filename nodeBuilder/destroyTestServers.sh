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

groupName=$(cat serverGroup)
serverIds=$(hcloud server list | grep ${groupName} | awk '{print $1}')

for id in ${serverIds}
do
    echo "Going to delete server ${id}"
    hcloud server delete ${id}
done


echo "
----------------
$(hostname) $0 completed
----------------
"