#!/bin/bash

CONFIG_DIR=/var/vcap/jobs/praeco/config
PACKAGE_DIR=/var/vcap/packages/praeco

ln -fs $CONFIG_DIR/api.config.json $PACKAGE_DIR/config/api.config.json
