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

if [[ $# -eq 0 ]]
  then
    echo "You must provide a a number of servers to create"
    exit
fi

numberOfServers=$1

groupName=$(dbus-uuidgen)
echo ${groupName} > serverGroup
echo '[jenkins]' > hosts

set -x
for ((server=0;server<${numberOfServers};server++))
do
    serverName="${groupName}-${server}"
    hcloud server create --name ${serverName} --image debian-9 --type cx11 --ssh-key jenkinsServer
    serverIp=$(hcloud server list -o noheader | grep ${serverName} | awk '{print $4}')
    echo "${serverIp} ansible_ssh_user=root" >> hosts
done

echo "Waiting until servers have all come up"
until ping -c 1 -W 1 ${serverIp} > /dev/null; do
    printf '.'
    sleep 1
done

ansible-playbook playbook.yml


echo "
----------------
$(hostname) $0 completed
----------------
"


#[jenkins]
#195.201.90.139 ansible_ssh_user=root
