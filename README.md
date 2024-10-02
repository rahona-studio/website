# Dockerized WordPress Instance

This repository contains the configuration files to set up a Dockerized WordPress instance using Docker Compose, based on the [DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose). It includes WordPress, a MySQL database, phpMyAdmin, and an NGINX web server, all containerized for easy setup and management.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup Instructions

### 1. Clone the repository

```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Environment Variables

Create a .env file in the root directory based on the .env.exemple file:
```bash
cp .env.exemple .env
```

Then, customize the .env file with your own credentials:
```
MYSQL_ROOT_PASSWORD=root-password
MYSQL_USER=mysql-user
MYSQL_PASSWORD=mysql-password
```

### 3. Docker Compose Configuration
The docker-compose.yml file includes services for:

- WordPress: The main application
- MySQL: The database
- certbot: A way to set up HTTPS communication
- NGINX: A reverse proxy server with SSL support

### 4. NGINX Configuration
You can configure your NGINX settings in the `nginx-conf/nginx.conf` and `nginx-conf/options-ssl-nginx.conf` files.

### 5. Running the Containers
Once everything is configured, start the containers:
```bash
docker-compose up -d
```

### 6. SSL Renewal Script

You can use the `ssl_renew.sh` script to renew SSL certificates when needed. Make sure to configure it to run periodically (e.g., using a cron job).

### 7. PHP Configuration

Customize your PHP settings in the `wordpress.ini` file to adjust memory limits, file upload sizes, and other PHP-related settings.

### 8. Stopping the Containers

To stop the running containers:

```bash
docker-compose down
```

This will stop and remove the containers, but your data will persist.

### 9. Removing Containers and Volumes

If you want to completely remove containers, networks, and volumes (this will delete your data):

```bash
docker-compose down --volumes
```

## Folder structure
```bash
.
├── docker-compose.yml             # Docker Compose configuration
├── .env.exemple                   # Example environment variables file
├── nginx-conf/
│   ├── nginx.conf                 # NGINX configuration file
│   └── options-ssl-nginx.conf     # NGINX SSL options
├── ssl_renew.sh                   # SSL renewal script
├── wordpress.ini                  # Custom PHP configuration
└── README.md                      # Project documentation
```

