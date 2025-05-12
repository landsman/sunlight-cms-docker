# SunLight CMS in Docker

This repository provides a Docker setup for [Sunlight CMS Skeleton](https://github.com/sunlight-cms/skeleton).

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Make (usually pre-installed on Linux/macOS, for Windows use [Make for Windows](http://gnuwin32.sourceforge.net/packages/make.htm))

## Quick Start

1. Clone this repository:
   ```
   git clone https://github.com/landsman/sunlight-cms-docker.git
   cd sunlight-cms-docker
   ```

2. Build and start the containers:
   ```
   make build
   make up
   ```

3. Install Sunlight CMS:
   ```
   make install
   ```
   Then follow the on-screen instructions to complete the installation.

## Available Commands

Run `make help` to see all available commands:

- `make build` - Build the Docker images
- `make up` - Start the containers
- `make down` - Stop the containers
- `make restart` - Restart the containers
- `make logs` - View container logs
- `make shell` - Enter the web container shell
- `make clean` - Remove containers, volumes, and images
- `make install` - Install Sunlight CMS

## Database Configuration

When installing Sunlight CMS, use the following database settings:

- Host: `db`
- Database: `sunlight`
- Username: `sunlight`
- Password: `sunlight_password`

## Customization

### Environment Variables

You can modify the database credentials and other settings in the `docker-compose.yml` file.

### Persistent Data

The following directories are mounted as volumes for data persistence:

- `./config` - Sunlight CMS configuration files
- `./upload` - Uploaded files
- `./mysql_data` - MySQL database files

### Custom Index Page

A custom index.php file is included in the web root directory. This file:

1. Attempts to redirect to common entry points for Sunlight CMS
2. If no entry point is found, displays a helpful page with information about the installation
3. Shows the directory structure and provides next steps

This ensures that a directory listing is not shown when accessing the root URL.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

This repository help you to run the project locally inside docker containers. So you don't need to have PHP or Database installed

- https://github.com/sunlight-cms/skeleton
- https://github.com/sunlight-cms/sunlight-cms
