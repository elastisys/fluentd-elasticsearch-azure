FROM quay.io/fluentd_elasticsearch/fluentd:v2.7.0

RUN apt-get update \
 && buildDeps="build-essential zlib1g-dev ruby-dev" \
 && apt-get install -y --no-install-recommends $buildDeps \
 && gem install fluent-plugin-azure-storage-append-blob --version 0.1.1 \
 && gem install fluent-plugin-concat --version 2.4.0 \
 && gem install fluent-plugin-detect-exceptions --version 0.0.12 \
 && gem install fluent-plugin-elasticsearch --version 3.5.4 \
 && gem install fluent-plugin-kubernetes_metadata_filter --version 2.2.0 \
 && gem install fluent-plugin-multi-format-parser --version 1.0.0 \
 && gem install fluent-plugin-prometheus --version 1.4.0 \
 && gem install fluent-plugin-systemd --version 1.0.2 \
 && apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
