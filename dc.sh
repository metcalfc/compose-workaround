#!/bin/bash 

_term() { 
  echo "Caught SIGTERM signal!" 
  /usr/bin/docker compose down
}

trap _term SIGTERM

echo "Starting Docker...";
/usr/bin/docker compose "$@" &

child=$! 
wait "$child"
echo