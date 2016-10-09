#!/bin/bash

# Buckle up
set -e
set -u

# Default supervisord params
SUPERVISOR_PARAMS='-c /etc/supervisord.conf'

# Execute all scripts in init
if [ "$(ls /config/init/)" ]; then
  for init in /config/init/*.sh; do
    . $init
  done
fi

# If we have an interactive container
if test -t 0; then
  # Run supervisord normally(in background-mode)
  supervisord $SUPERVISOR_PARAMS
  
  # Execute commands passed to container and exit, or run bash
  if [[ $@ ]]; then 
    eval $@
  else 
    export PS1='[\u@\h : \w]\$ '
    /bin/bash
  fi

# If container is detached run superviord in the foreground 
else
  # Execute additional params
  if [[ $@ ]]; then 
    eval $@
  fi
  supervisord -n $SUPERVISOR_PARAMS
fi
