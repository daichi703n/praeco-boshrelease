# Praeco BOSH Release

[Praeco](https://github.com/ServerCentral/praeco) for BOSH.

## Deployment

### (WIP) Bump ElastAlert to 0.1.39
ElastAlert above 0.1.39 is requierd for using praeco. I tested localy with this commit (https://github.com/daichi703n/elastalert-boshrelease/commit/e23b208e007e3219bf69fe4cfa97c8d17089ee87), but not yet merge into https://github.com/bosh-elastic-stack/elastalert-boshrelease .

At this time, please create ElastAlert 0.1.39 BOSH Release localy.

### Standalone example

```
bosh deploy -d praeco manifests/praeco.yml \
  -l manifests/versions.yml \
  -v es_host=elasticsearch.example.com \
  -v es_port=9200 \
  -o manifests/ops-files/praeco-slack-config.yml \
  -v praeco_slack_webhook_url=https://hooks.slack.com/services/XXX/XXX/XXXXX \
  -o manifests/ops-files/elastalert-rule-monitor-error-log.yml
  --no-redact
```

### Collocate with elastic-stack-bosh-deployment
This BOSH Release is compatible with [Elastic Stack BOSH Deployment](https://github.com/bosh-elastic-stack/elastic-stack-bosh-deployment)

Please use `manifests/ops-files/elk-praeco.yml`.

```
bosh -d elastic-stack deploy elastic-stack.yml \
  -l versions.yml \
...
  
  -o praeco-boshrelease/manifests/ops-files/elk-praeco.yml \
  -l praeco-boshrelease/manifests/versions.yml \
  -v praeco_external_url="https://praeco.<DOMAIN>"
```

With self built elastalert 0.1.39.

```
- type: replace
  path: /releases/name=elastalert
  value:
    name: elastalert
    version: latest
```

## Note
This BOSH Release is WIP.

If you met some problem, please create the issue and contact me.
