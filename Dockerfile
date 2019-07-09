FROM circleci/node:11-browsers

USER root

RUN set -ex; \
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/sonar-scanner/install.sh -O- | sh; \
    sonar-scanner --version
