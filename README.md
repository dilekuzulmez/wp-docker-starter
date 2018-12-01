# Wordpress Docker Starter with a Clean Template (BETA)
Wordpress development environment with Docker. Template is being developed with Flexible Grid System. (This documentation will be updated soon) (Only tested on mac)


## What does it do?
### When Installing
1. Finds an available local IP on your computer
2. Makes that IP available to install Docker servers
3. Changes the theme folder name with the **"SLUG"** environment variable (from .env file)
4. Changes the theme function.php function prefixes with the **"PREFIX"** environment variable (from .env file)
5. Updates the theme information like **"Theme Name"**, **"Theme Description"** with the **"NAME"** and **"DESC"** environment variables (from .env file)
6. Creates the **Wordpress, MySQL, WP-CLI, PHPMyAdmin and NodeJS(for Gulp)** Docker containers and runs them
7. Make the development domain name (**"DOMAIN"** environment variable from .env file) available by adding the available IP to **"/etc/hosts"** file
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
	

## Usage
### Installation & Start with Gulp
```bash
sudo bash install
```

### Restarting
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