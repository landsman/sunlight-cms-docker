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
   A pre-filled configuration has been provided to simplify the installation process. Then follow the on-screen instructions to complete the installation.

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
- `make remove-install` - Remove the installation directory from the container
- `make start-over` - Completely reset the environment and start over

## Pre-filled Configuration

A pre-filled configuration has been provided to simplify the installation process. The following settings are pre-configured:

### Database Configuration

- Host: `db`
- Database: `sunlight`
- Username: `sunlight`
- Password: `sunlight_password`
- Table prefix: `sunlight_`

### Admin Account

- Username: `admin`
- Password: `admin` (please change this after installation)
- Email: `admin@example.com`

### Site Configuration

- Site name: `Sunlight CMS`
- Site description: `My Sunlight CMS Website`
- Admin email: `admin@example.com`

You can customize these settings by:
1. Modifying the `config.php` file in the repository before building the Docker image (this will be used as the template for new installations)
2. Editing the `config.php` file in the `./config` directory after the container has started (this will persist across container rebuilds)

## Customization

### Environment Variables

You can modify the database credentials and other settings in the `docker-compose.yml` file.

### Persistent Data

The following directories are mounted as volumes for data persistence:

- `./config` - Sunlight CMS configuration files
- `./upload` - Uploaded files
- `./mysql_data` - MySQL database files

#### Configuration Persistence

The `config.php` file is automatically created in the `./config` directory on the host when the container starts for the first time. This file contains the pre-filled configuration for Sunlight CMS.

Any changes made to the configuration file inside the container will be persisted to the host, and will not be lost when the container is rebuilt. This ensures that your configuration settings are preserved across container rebuilds.

### Custom Index Page

A custom index.php file is included in the web root directory. This file:

1. Attempts to redirect to common entry points for Sunlight CMS
2. If no entry point is found, displays a helpful page with information about the installation
3. Shows the directory structure and provides next steps

This ensures that a directory listing is not shown when accessing the root URL.

## Starting Over

If you need to completely reset your environment and start over, you can use the `start-over` command:

```
make start-over
```

This command will:

1. Remove all Docker containers, volumes, and images
2. Delete all data directories (`./config`, `./upload`, and `./mysql_data`)
3. Provide instructions for rebuilding and restarting the environment

**Warning**: This will delete all your data, including:
- Configuration files
- Uploaded files
- Database data
- Any customizations you've made

Make sure to back up any important data before running this command.

### When to Use Start Over

You might want to start over if:
- You've encountered issues with your installation that you can't resolve
- You want to test the installation process from scratch
- You want to reset your development environment to a clean state

### After Starting Over

After running `make start-over`, you'll need to rebuild and restart the environment:

1. Build the Docker images:
   ```
   make build
   ```

2. Start the containers:
   ```
   make up
   ```

3. Install Sunlight CMS:
   ```
   make install
   ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

This repository helps you to run the project locally inside docker containers. So you don't need to have PHP or Database installed

- https://github.com/sunlight-cms/skeleton
- https://github.com/sunlight-cms/sunlight-cms
