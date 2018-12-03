# Wordpress Docker Starter with a Clean Template (BETA)
Wordpress development environment with Docker. Template is being developed with Flexible Grid System. (This documentation will be updated soon) (Only tested on mac)
<br><br>

## Usage
First, you need to update the **".env"** file with the format as it currently has:
```bash
# SITE INFO

## Local development domain
DOMAIN=dev.sitename.com


# IF YOU ARE IMPORTING AN EXISTING SITE (STRING REPLACE COMING SOON)
# 1. Add your DB .sql file to the "/database/dump/" folder
# 2. Replace the existing "/wp-content/" folder with your "/wp-content/" folder
# 3. Uncomment the line below and write the old domain name
# OLD_DOMAIN="https://www.example.com"



# IF YOU WANT TO START FROM SCRATCH, FILL THE INFO BELOW

## Active theme folder name
SLUG=site-name

## Site Name
NAME="Site Name"

## Site tagline
DESC="Site tagline"

## Function prefixes (sitename_)
PREFIX=sitename



# SITE SETTINGS

## Site timezone
TIMEZONE="America/Los_Angeles"

## Posts permalinks structure
POST_PERMALINK="/%category%/%postname%/"



# PRIMARY ADMIN

## Admin Username
ADMIN_USERNAME="Twelve12"

## Admin first name
ADMIN_NAME="Bill"

## Admin Last Name
ADMIN_LAST_NAME="T."

## Admin email
ADMIN_EMAIL="webdesign@twelve12.com"

## Admin URL
ADMIN_URL="https://www.twelve12.com"



# SECONDARY ADMIN

## Secondary Admin username
DEVELOPER_USERNAME="Cuneyt"

## Secondary Admin first name
DEVELOPER_NAME="Cuneyt"

## Secondary Admin last name
DEVELOPER_LAST_NAME="T."

## Secondary Admin email
DEVELOPER_EMAIL="cuneyt@twelve12.com"



# Plugins that needs to be installed
PLUGINS="custom-codes responsivity simplest-under-construction admin-menu-restriction duplicator wp-mail-logging google-analytics-for-wordpress fast-velocity-minify invisible-recaptcha"


# Don't touch this if you don't know what you are doing!
IP=127.0.0.1
```


### Installation & Start with Gulp
```bash
sudo bash install
```

### Restarting with Gulp
```bash
bash start
```

### Stop the server temporarily
```bash
bash pause
```

### Removing
```bash
sudo bash stop
```
<br><br>

## What does it do?
### When Installing *(sudo bash install)*
1. Finds an available local IP on your computer
2. Makes that IP available to install Docker servers
3. Changes the theme folder name with the **"SLUG"** environment variable (from .env file)
4. Changes the theme function.php function prefixes with the **"PREFIX"** environment variable (from .env file)
5. Updates the theme information like **"Theme Name"**, **"Theme Description"** with the **"NAME"** and **"DESC"** environment variables (from .env file)
6. Creates the **Wordpress, MySQL, WP-CLI, PHPMyAdmin and NodeJS(for Gulp)** Docker containers and runs them
7. Makes the development domain name (**"DOMAIN"** environment variable from .env file) available by adding the available IP to **"/etc/hosts"** file
8. Installs the NPM packages in theme folder to build the **"style.css"** file from **"style.scss"** file with Gulp
9. Does the Wordpress works that's defined in **"wp.sh"** file:
	* Installs the Wordpress
	* Adds the administrator user that's defined in **".env"** file
		* Hides the admin bar from frontend
		* Closes the the "Welcome" box on dashboard
		* Closes the the "Try Gutenberg" box on dashboard
	* Adds the developer user that's defined in **".env"** file
		* Hides the admin bar from frontend
		* Closes the the "Welcome" box on dashboard
		* Closes the the "Try Gutenberg" box on dashboard
	* Discourages search engines from indexing this site
	* Updates the tagline as defined in **".env"** file
	* Updates the timezone as defined in **".env"** file
	* Updates the blog posts permalink structure as defined in **".env"** file
	* Activates the theme that's in the **"/wp-content/themes/"** folder
	* Deletes the other default themes **(twentyfifteen, twentyseventeen and twentysixteen)**
	* Deletes the default plugins **(Akismet and Hello Dolly)**
	* Installs the plugins that are listed in **".env"** file
	* Deletes the **"Sample Page"**
	* Updates the **"Uncategorized"** post category as **"Blog"**
	* Adds the **"Home"** page
		* Assigns the "/templates/home-page.php" template
		* Makes it default static front page
	* Adds the **"Blog"** page
		* Makes it default static posts page

### When Starting *(bash start)*
1. Runs the Docker containers
2. Runs the Gulp to watch SASS changes


### When pausing *(bash pause)*
1. Only stops the Docker containers


### When stopping/removing *(sudo bash stop)*
1. Stops and removes the Docker containers
2. Makes the IP unavailable to install Docker servers
3. Makes the development domain name (**"DOMAIN"** environment variable from .env file) unavailable by removing the IP from **"/etc/hosts"** file