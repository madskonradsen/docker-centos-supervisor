# CentOS7 docker-image with supervisor
[![Circle CI](https://circleci.com/gh/madskonradsen/docker-centos-supervisor.svg?style=svg)](https://circleci.com/gh/madskonradsen/docker-centos-supervisor)

It's built on top of the [centos:centos7](https://registry.hub.docker.com/_/centos/) image which only adds 20MB.

## Features

 - Supervisord loads its services from `/etc/supervisor.d/`. Add configurations there to have them launched, by adding entries to your `Dockerfile`. For example: `ADD myService.conf /etc/supervisord.d/myService.conf`
 - All scripts inside `/config/init/*.sh` are runned automatically on startup before supervisord
 - Can be launched with both in detached and interactive mode and runs all commands passed to it