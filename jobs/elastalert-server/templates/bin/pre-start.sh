#!/bin/bash

CONFIG_DIR=/var/vcap/jobs/elastalert-server/config
PACKAGE_DIR=/var/vcap/packages/elastalert-server

ln -fs $CONFIG_DIR/config.json $PACKAGE_DIR/config/config.json
# ln -fs $PACKAGE_DIR/config/elastalert.yaml $PACKAGE_DIR/config.yaml
ln -fs $CONFIG_DIR/config.yaml /var/vcap/packages/elastalert/config.yaml

ln -fs /var/vcap/packages/python2.7/lib/libpython2.7.so.1.0 /lib/x86_64-linux-gnu/
