#!/bin/bash

CONFIG_DIR=/var/vcap/jobs/praeco/config
PACKAGE_DIR=/var/vcap/packages/praeco
STORE_DIR=/var/vcap/store/praeco
ELASTALERT_JOB_DIR=/var/vcap/jobs/elastalert
ELASTALERT_PACKAGE_DIR=/var/vcap/packages/elastalert

# ln -fs $CONFIG_DIR/api.config.json $PACKAGE_DIR/config/api.config.json

#TODO: if not exist
# mkdir $ELASTALERT_PACKAGE_DIR/rules
mkdir $STORE_DIR/rules
mkdir $STORE_DIR/rule_templates
ln -fs $CONFIG_DIR/BaseRule.config $ELASTALERT_SERVER_STORE_DIR/rules/BaseRule.config
# ln -fs $STORE_DIR/rules $ELASTALERT_JOB_DIR/rules/praeco_rules
# ln -fs $STORE_DIR/rule_templates $ELASTALERT_JOB_DIR/rules/praeco_rule_templates

ln -fs $CONFIG_DIR/praeco.config.json $PACKAGE_DIR/public/praeco.config.json
ln -fs $ELASTALERT_JOB_DIR/rules $STORE_DIR/rules/static_rules
