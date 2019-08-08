#!/bin/bash
set -euo pipefail
symfony(){
	if [[ -d "/var/www/html" ]]; then
		cd /var/www
		composer create-project symfony/website-skeleton projet
		chmod 777 -R projet
		#mv -a  /var/www/html
		mv projet /var/www/html
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
