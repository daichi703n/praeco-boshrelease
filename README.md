# Praeco BOSH Release

[Praeco](https://github.com/johnsusek/praeco) for BOSH.

## Deployment

### ElastAlert
ElastAlert (v0.1.39 or newer) is required for using Praeco.
Refer to the [ElastAlert BOSH Release](https://github.com/bosh-elastic-stack/elastalert-boshrelease).

```
VERSION=x.y.z
bosh upload-release https://github.com/bosh-elastic-stack/elastalert-boshrelease/releases/download/${VERSION}/elastalert-boshrelease-${VERSION}.tgz
```

### Standalone Example
To deploy Praeco standalone, use the following command:

```
bosh deploy -d praeco manifests/praeco.yml \
  -l manifests/versions.yml \
  -v es_host=localhost \
  -v es_port=9200 \
  -o manifests/ops-files/praeco-slack-config.yml \
  -v praeco_slack_webhook_url=https://hooks.slack.com/services/XXX/XXX/XXXXX \
  -o manifests/ops-files/elastalert-rule-monitor-error-log.yml \
  --no-redact
```

### Collocate with Elastic Stack BOSH Deployment
This BOSH Release is compatible with the [Elastic Stack BOSH Deployment](https://github.com/bosh-elastic-stack/elastic-stack-bosh-deployment).

Please use `manifests/ops-files/elk-praeco.yml`.

```
bosh -d elastic-stack deploy elastic-stack.yml \
  -l versions.yml \
  ...
  -o praeco-boshrelease/manifests/ops-files/elk-praeco.yml \
  -l praeco-boshrelease/manifests/versions.yml \
  -v praeco_external_url="https://praeco.<DOMAIN>"
```

## Support
If you encounter any problems, please create an issue and contact me.
