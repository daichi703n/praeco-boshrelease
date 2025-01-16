#!/bin/bash

CONFIG_DIR=/var/vcap/jobs/elastalert-server/config
PACKAGE_DIR=/var/vcap/packages/elastalert-server

mkdir -p $PACKAGE_DIR/config/ 

ln -fns $CONFIG_DIR/config.json $PACKAGE_DIR/config/config.json
ln -fns $CONFIG_DIR/config.yaml /var/vcap/packages/elastalert/config.yaml
