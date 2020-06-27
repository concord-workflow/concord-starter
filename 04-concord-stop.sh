#!/usr/bin/env bash

source ./concord/setup

docker rm -f agent server dind socat $CONCORD_DB_NAME
