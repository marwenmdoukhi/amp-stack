#!/bin/bash
set -euo pipefail
symfony(){
	if [[ ! "$(ls -A /var/www/html)" ]]; then
		cd /var/www
		composer create-project symfony/website-skeleton symfony
		chmod 777 -R symfony
		cd symfony
		cp -a . /var/www/html
		rm -r /var/www/symfony
		echo "[OK] symfony seccessfly initilized"
	else
		echo "[NOTICE] symfony alrady initilized ..."
	fi
}
if [[ "$1" == apache2* ]]; then
        echo ""
        echo "* SERVER INITIALIZING ... *"
        echo ""
        symfony
		echo ""
        echo "* SERVER STARTED SUCCESSFULY *"
        echo ""
fi
exec "$@"