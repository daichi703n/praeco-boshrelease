# Praeco BOSH Release (WIP)

[Praeco](https://github.com/ServerCentral/praeco) for BOSH.

## Deployment
```
bosh sync-blobs
bosh create-release --name=praeco --force --timestamp-version --tarball=/tmp/praeco-boshrelease.tgz
bosh upload-release /tmp/praeco-boshrelease.tgz
```

(WIP) final-release is not yet created.

Please update `es_host`, `es_port` on praeco.yml and deploy.


### Collocate with elastic-stack-bosh-deployment
This BOSH Release is compatible with [Elastic Stack BOSH Deployment](https://github.com/bosh-elastic-stack/elastic-stack-bosh-deployment)

Please use `ops-files/elk-praeco.yml`.

## Note
This BOSH Release is WIP.

If you met some problem, please create the issue and contact me.
