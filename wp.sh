#!/bin/bash

source .env

function wp {
	command docker-compose run --no-deps --rm wpcli --allow-root "$@"
}

# WP Installation
wp core install --url="http://${DOMAIN}" --title="${NAME}" --admin_user=${ADMIN_USERNAME} --admin_email=${ADMIN_EMAIL} --skip-email

# Update admin info
wp user update ${ADMIN_USERNAME} --user_url=${ADMIN_URL} --display_name="${ADMIN_NAME} ${ADMIN_LAST_NAME}" --first_name="${ADMIN_NAME}" --last_name="${ADMIN_LAST_NAME}"

# Hide the admin bar
wp user meta update ${ADMIN_USERNAME} show_admin_bar_front 0

# Hide Welcome panel
wp user meta update ${ADMIN_USERNAME} show_welcome_panel 0
wp user meta update ${ADMIN_USERNAME} show_try_gutenberg_panel 0

# Create the developer user
if [ ${DEVELOPER_EMAIL} != ${ADMIN_EMAIL} ] && [ ${DEVELOPER_EMAIL} != "" ]
then

	PASSWORD_INFO="$(wp user create ${DEVELOPER_USERNAME} ${DEVELOPER_EMAIL} --user_url=${ADMIN_URL} --display_name="${DEVELOPER_NAME} ${DEVELOPER_LAST_NAME}" --first_name="${DEVELOPER_NAME}" --last_name="${DEVELOPER_LAST_NAME}" --role=administrator)"
	echo "${PASSWORD_INFO}"
	export ONLY_PASSWORD=${PASSWORD_INFO##*$'\n'}

	wp user meta update ${DEVELOPER_USERNAME} show_admin_bar_front 0
	wp user meta update ${DEVELOPER_USERNAME} show_welcome_panel 0
	wp user meta update ${DEVELOPER_USERNAME} show_try_gutenberg_panel 0

else

	DEVELOPER_NAME=${ADMIN_USERNAME}

fi

# Discourage search engines from indexing this site
wp option set blog_public 0

# Update the tagline
wp option update blogdescription "${DESC}"

# Update the timezone
wp option update timezone_string "${TIMEZONE}"

# Update permalink settings
wp rewrite structure "${POST_PERMALINK}"

# Activate our theme
wp theme activate ${SLUG}

# Delete the other themes
wp theme delete twentyfifteen twentyseventeen twentysixteen

# Delete the default plugins
wp plugin delete akismet hello

# Install our plugins (--activate)
wp plugin install ${PLUGINS}

# Change the Blog category
wp term update category 1 --name=Blog --slug=blog

# Delete the default Sample Page
wp post delete 2 --force

# Add the homepage
wp post create --post_type=page --post_title='Home' --meta_input='{"_wp_page_template":"templates/home-page.php"}' --post_status=publish

# Update the static page
wp option update page_on_front 4
wp option update show_on_front page

# Add the blog page
wp post create --post_type=page --post_title='Blog' --post_status=publish

# Update the static page
wp option update page_on_front 4
wp option update page_for_posts 5
wp option update show_on_front page