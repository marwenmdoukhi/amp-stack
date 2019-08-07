#!/bin/bash
set -euo pipefail
wordpress_initilizing(){
	if [[ -d "/var/www/html" ]]; then
		cd /var/www
		composer create-project symfony/website-skeleton projet
		chmod 777 -R projet
		#mv -a  /var/www/html
		mv projet /var/www/html
		echo "[OK] Wordpress seccessfly initilized"
	else
		echo "[NOTICE] Wordpress alrady initilized ..."
	fi
}
if [[ "$1" == apache2* ]]; then
        echo ""
        echo "* SERVER INITIALIZING ... *"
        echo ""
        #wordpress_initilizing
		echo ""
        echo "* SERVER STARTED SUCCESSFULY *"
        echo ""
fi
exec "$@"