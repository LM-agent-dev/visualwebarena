# Docker for WebArena Websites
This REAME file host the instructions for our Docker images and quick start guide for starting up websites used in VisualWebArena.

## Classifieds Website

Download the image zip from one of the following:
- https://drive.google.com/file/d/1m79lp84yXfqdTBHr6IS7_1KkL4sDSemR/view
- https://archive.org/download/classifieds_docker_compose

```
unzip classifieds_docker_compose.zip
cd classifieds_docker_compose
vi classifieds_docker_compose/docker-compose.yml  # Set CLASSIFIEDS to your site url `http://<your-server-hostname>:9980/`, and change the reset token if required
docker compose up --build -d
# Wait for compose up to finish. This may take a while on the first launch as it downloads several large images from dockerhub.
docker exec classifieds_db mysql -u root -ppassword osclass -e 'source docker-entrypoint-initdb.d/osclass_craigslist.sql'  # Populate DB with content
```
Now you can visit `http://<your-server-hostname>:9980`.


## Shopping Website (OneStopShop)

## Social Forum Website (Reddit)

## Wikipedia Website

Just the repeat what's done in the `webarena` docs.

## Homepage

The homepage lists all available websites which the agent can use to navigate to different sites.
![Homepage](../media/homepage_demo.png)

To host the homepage, first change `<your-server-hostname>` to the corresponding server hostnames in [webarena-homepage/templates/index.html](webarena-homepage/templates/index.html)
```bash
# Define your actual server hostname
YOUR_ACTUAL_HOSTNAME="coffee.cs.columbia.edu"
# Remove trailing / if it exists
YOUR_ACTUAL_HOSTNAME=${YOUR_ACTUAL_HOSTNAME%/}
# Use sed to replace placeholder in the HTML file
perl -pi -e "s|<your-server-hostname>|${YOUR_ACTUAL_HOSTNAME}|g" webarena-homepage/templates/index.html
```

Since I customized the site urls and port for reddit/onestopshop/etc, also edit the links to reflect this
```
environment_docker/webarena-homepage/templates/index.html
```

Then run under the `coffee` host not inside any container:
```
cd webarena-homepage
flask run --host=0.0.0.0 --port=55399
```
The homepage will be available at `http://coffee.cs.columbia.edu:55399`.
