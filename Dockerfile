FROM centos:centos7
MAINTAINER Mads Konradsen (madskonradsen)

# - Install basic packages (e.g. python-setuptools is required to have python's easy_install)
# - Install yum-utils so we have yum-config-manager tool available
# - Install inotify, needed to automate daemon restarts after config file changes
# - Install jq, small library for handling JSON files/api from CLI
# - Install pip properly
# - Install supervisord via pip
RUN \
  yum update -y && \
  yum install -y epel-release && \
  yum install -y iproute python-setuptools hostname inotify-tools yum-utils which jq && \
  yum install -y python-pip && pip install pip --upgrade && \
  yum clean all && \
  pip install --no-deps --ignore-installed --pre supervisor

# Add supervisord.conf, bootstrap.sh files
COPY container-files /

ENTRYPOINT ["/config/bootstrap.sh"]
