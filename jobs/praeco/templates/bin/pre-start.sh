#!/bin/bash

CONFIG_DIR=/var/vcap/jobs/praeco/config
PACKAGE_DIR=/var/vcap/packages/praeco
ELASTALERT_PACKAGE_DIR=/var/vcap/packages/elastalert

ln -fs $CONFIG_DIR/api.config.json $PACKAGE_DIR/config/api.config.json

mkdir $ELASTALERT_PACKAGE_DIR/rules
mkdir $ELASTALERT_PACKAGE_DIR/rule_templates
ln -fs $CONFIG_DIR/BaseRule.config $ELASTALERT_PACKAGE_DIR/rules/BaseRule.config
