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

composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition ${DIR}/magento

cp -r ${DIR}/magento/. ${webDirectory}

cd ${webDirectory}

php ${webDirectory}/bin/magento setup:install \
 --base-url="http://www.magento2.dev/" \
 --db-host="localhost" \
 --db-name="magento2" \
 --db-user="magento2" \
 --db-password="magento2" \
 --admin-firstname="admin" \
 --admin-lastname="user" \
 --admin-email="test@example.com" \
 --admin-user="admin" \
 --admin-password="admin123" \
 --language="en_US" \
 --currency="USD" \
 --timezone="Europe/London" \
 --use-rewrites=0 \
 --backend-frontname=admin

 chown -R www-data ${webDirectory}

ls -lah


echo "
----------------
$(hostname) $0 completed
----------------
"