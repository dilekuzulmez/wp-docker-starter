# Colors
GREEN='\033[1;32m' # Green
RED='\033[1;31m' # Red
RESET='\033[0m' # No Color




function self_update () {

	# Builder updates
	echo "Updating the builder..."
	git pull
	echo -e "Builder update complete ... ${GREEN}done${RESET}"

}

function server_permission_update () {

	echo "Fixing the server file permissions in ($1)..."
	#docker-compose exec wp chown -R www-data:www-data $1
	docker-compose exec wp chmod -R a=rwx $1
	# docker-compose exec wp find $1 -type d -exec chmod 755 {} \;
	# docker-compose exec wp find $1 -type f -exec chmod 644 {} \;
	echo -e "Server file permissions fixed ... ${GREEN}done${RESET}"

}

function permission_update () {

	echo "Fixing the file permissions in ($1)..."
	sudo chown -R $(whoami):staff $1
	sudo chmod -R a=rwx $1
	# find $1 -type d -exec chmod 755 {} \;
	# find $1 -type f -exec chmod 644 {} \;
	echo -e "File permissions fixed ... ${GREEN}done${RESET}"

}