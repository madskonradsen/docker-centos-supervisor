# CentOS 7 Docker-image with Supervisor
[![Circle CI](https://circleci.com/gh/madskonradsen/docker-centos-supervisor.svg?style=svg)](https://circleci.com/gh/madskonradsen/docker-centos-supervisor)

https://hub.docker.com/r/madskonradsen/centos-supervisor

`docker pull madskonradsen/centos-supervisor`

It's built on top of the [centos:centos7](https://registry.hub.docker.com/_/centos/) image which only adds 20MB.

## Features

 - Supervisord loads its services from `/etc/supervisor.d/`. Add configurations in there to have them launched by simply adding entries to your `Dockerfile`. For example: `ADD myService.conf /etc/supervisord.d/myService.conf`
 - All scripts inside `/config/init/*.sh` are runned automatically on startup before supervisord
 - Can be launched with both in detached and interactive mode and runs all commands passed to it
