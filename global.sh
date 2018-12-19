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