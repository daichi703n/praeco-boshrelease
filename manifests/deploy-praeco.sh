bosh deploy -d praeco manifests/praeco.yml \
  -v slack_webhook_url=https://hooks.slack.com/services/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 \
  -o manifests/ops-files/praeco-slack-config.yml \
  -v praeco_slack_webhook_url=https://hooks.slack.com/services/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 \
  --no-redact \
  -o manifests/ops-files/elastalert-rule-monitor-error-log.yml
