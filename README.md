alpine-nginx
==================

[![](https://badge.imagelayers.io/rlesouef/alpine-nginx:latest.svg)](https://imagelayers.io/?images=rlesouef/alpine-nginx:latest 'Get your own badge on imagelayers.io')

Nginx server for Alpine Linux

Usage
-----

To create the image `rlesouef/alpine-nginx`, execute the following command on the `alpine-nginx` folder:

    docker build -t rlesouef/alpine-nginx .


Running your Nginx docker image
-------------------------------

Start your image building the external ports 80 in all interfaces to your container:

    docker run -d -p 80:80 rlesouef/alpine-nginx

Test your deployment:

    curl http://localhost/

Hello world!

Loading your custom PHP application
-----------------------------------

In order to replace the "Hello World" application that comes bundled with this docker images, first create a new empty folder. Go to the new folder and create two subfolders: `sites-enabled` and `app`. Copy your configuration files to `sites-enabled` and you application files to `app`. Then create a new `Dockerfile` with the following contents:

    FROM rlesouef/alpine-nginx
    ADD sites-enabled/ /etc/nginx/sites-enabled/
    ADD app/ /app/
    RUN chown -R www-data:www-data /app/
    EXPOSE 80

Remember to put your configuration files under the folder named `sites-enabled` and your website files under the folder `app`. Also, if you want to use a different port, change the `EXPOSE 80` in `Dockerfile` as well.(eg. `EXPOSE 443 80` will allow connections go through port `443` and `80`).
After that, build the new `Dockerfile`:

    docker build -t username/my-nginx

And test it:

    docker run -d -P username/my-nginx

Test your deployment:

    curl http://localhost/

That's it!
