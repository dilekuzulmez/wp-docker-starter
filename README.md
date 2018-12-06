# Wordpress Docker Starter with a Clean Template (BETA)
Wordpress development environment with Docker. Template is being developed with Flexible Grid System. (This documentation will be updated soon) (Only tested on mac)
<br><br>

## Usage & Preparation
It has three types of using:
1. Installing Wordpress with my empty starter template (Default)
	* Nothing to do, just start installation
2. Installing Wordpress with your own theme
	* Put your theme folder(s) to "site/wp-content/themes/" folder
	* Start installation and don't forget to type your theme folder name to activate on WP, when it asks for "Active theme folder name"
3. Installing an existing Wordpress with a database dump and "site/wp-content" folder
	* Put your .sql file to "site/database/dump/" folder
	* Replace the "site/wp-content" with your own "site/wp-content" folder
	* Start installation and don't forget to type your full old website URL to replace on WP DB, when it asks for "Old full website URL" (With "http:// or https:// protocol) (Not done yet)


### Installation
```bash
sudo bash install
```

### Restarting
```bash
sudo bash start
```

### Stop the server temporarily
```bash
sudo bash pause
```

### Uninstalling
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
	* Activates the theme that's in the **"/site/wp-content/themes/"** folder
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
10. Asks for the BitBucket login info to create a private repository for this site
11. Runs the Gulp to watch SASS changes (If package.json and gulpfile.js files exist in the active theme folder)

### When Starting *(bash start)*
1. Runs the Docker containers, or starts installation if not already done
2. Runs the Gulp to watch SASS changes (If package.json and gulpfile.js files exist in the active theme folder)


### When stopping *(bash pause)*
1. Only stops the Docker containers


### When uninstalling *(sudo bash stop)*
1. Stops and removes the Docker containers
2. Removes the development domain name from **"/etc/hosts"** file