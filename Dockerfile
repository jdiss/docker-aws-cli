FROM alpine:3.8

ENV AWS_CLI_VERSION=1.15.59
ENV JP_VERSION=0.1.3

RUN apk -v --no-cache --update add \
        python \
        py-pip \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        curl \
        wget \
        zip \
        git \
        && \
    pip install --no-cache-dir --upgrade awscli==$AWS_CLI_VERSION && \
    update-ca-certificates && \
    apk -v --purge del py-pip
RUN curl -o /usr/local/bin/jp -L https://github.com/jmespath/jp/releases/download/$JP_VERSION/jp-linux-amd64 && \
    chmod +x /usr/local/bin/jp

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]
WORKDIR /opt/app

CMD ["aws", "--version"]