FROM openjdk:11-jre-slim-buster AS download-redpen

ENV redpen_ver 1.10.4

WORKDIR /tmp
RUN apt-get update && apt-get -y install curl
RUN curl -sL https://github.com/redpen-cc/redpen/releases/download/redpen-${redpen_ver}/redpen-${redpen_ver}.tar.gz | tar xz
RUN mv /tmp/redpen-distribution-${redpen_ver} /tmp/redpen-distribution

FROM openjdk:11-jre-slim-buster

COPY --from=download-redpen /tmp/redpen-distribution/* /usr/local/

RUN export PATH=$PATH:/usr/local/bin
WORKDIR /data

CMD ["/usr/local/bin/redpen"]
