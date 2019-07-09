# Praeco BOSH Release (WIP)

[Praeco](https://github.com/ServerCentral/praeco) for BOSH.

## Deployment
```
bosh sync-blobs
bosh create-release --name=praeco --force --timestamp-version --tarball=/tmp/praeco-boshrelease.tgz
bosh upload-release /tmp/praeco-boshrelease.tgz
```

(WIP) final-release is not yet created.

### Standalone example

```
bosh deploy -d praeco manifests/praeco.yml \
  -v es_host=elasticsearch.example.com \
  -v es_port=9200 \
  -o manifests/ops-files/praeco-slack-config.yml \
  -v praeco_slack_webhook_url=https://hooks.slack.com/services/XXX/XXX/XXXXX \
  -o manifests/ops-files/elastalert-rule-monitor-error-log.yml
  --no-redact
```

### Collocate with elastic-stack-bosh-deployment
This BOSH Release is compatible with [Elastic Stack BOSH Deployment](https://github.com/bosh-elastic-stack/elastic-stack-bosh-deployment)

Please use `ops-files/elk-praeco.yml`.

```
bosh -d elastic-stack deploy elastic-stack.yml \
  -l versions.yml \
...
  -o praeco-boshrelease/ops-files/elk-praeco.yml \
  -v praeco_external_url="https://praeco.<DOMAIN>"
```

## Note
This BOSH Release is WIP.

If you met some problem, please create the issue and contact me.
