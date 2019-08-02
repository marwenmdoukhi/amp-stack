#!/bin/bash
set -euo pipefail
wordpress_initilizing(){
	if [[ -d "/var/www/html" ]]; then
		cd /var/www
		wget composer create-project symfony/skeleton symfony
		cd symfony
		mv * ../html
		echo "[OK] symfony seccessfly initilized"
	else
		echo "[NOTICE] symfony alrady initilized ..."
	fi
}
if [[ "$1" == apache2* ]]; then
        echo ""
        echo "* SERVER INITIALIZING ... *"
        echo ""
        wordpress_initilizing
		echo ""
        echo "* SERVER STARTED SUCCESSFULY *"
        echo ""
fi
exec "$@"
