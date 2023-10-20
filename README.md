# Docker container for Unbound

This container uses the Alpine Linux base image and installs the Unbound DNS server, along with a minimal bootstrap
script which sets up the container at runtime for Unbound.

## Getting Started

The Unbound configuration files are stored in the `/etc/unbound` directory which you can mount as a volume with your
custom configuration files.

## Bootstrap Phase

When the container is started, the `bootstrap` script is used as the entrypoint, which simply executes init scripts
stored in the `/etc/unbound/bootstrap.d` directory before starting the `unbound` process through the `exec` command.

## License

This project is licensed under the Apache-2.0 License - see the LICENSE file for details.
