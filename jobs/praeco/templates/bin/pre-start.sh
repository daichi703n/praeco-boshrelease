#!/bin/bash

CONFIG_DIR=/var/vcap/jobs/praeco/config
PACKAGE_DIR=/var/vcap/packages/praeco
STORE_DIR=/var/vcap/store/praeco

#TODO: if not exist
mkdir -p $STORE_DIR/rules $STORE_DIR/rule_templates
ln -fns $CONFIG_DIR/BaseRule.config $STORE_DIR/rules/BaseRule.config
ln -fns $CONFIG_DIR/praeco.config.json $PACKAGE_DIR/dist/praeco.config.json
ln -fns $STORE_DIR/rules /var/vcap/packages/elastalert/rules
ln -fns $STORE_DIR/rule_templates /var/vcap/packages/elastalert/rule_templates
