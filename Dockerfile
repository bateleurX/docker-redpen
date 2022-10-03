FROM curlimages/curl:latest AS download-redpen

ENV redpen_ver 1.10.4

WORKDIR /tmp
RUN curl -sL https://github.com/redpen-cc/redpen/releases/download/redpen-${redpen_ver}/redpen-${redpen_ver}.tar.gz | tar -xz
RUN mv /tmp/redpen-distribution-${redpen_ver} /tmp/redpen-distribution

FROM ibm-semeru-runtimes:open-11-jre-jammy

COPY --from=download-redpen /tmp/redpen-distribution/ /usr/local/

WORKDIR /data

# この部分はIBM Semeru Runtime DockerfileのSCCデータ生成部分を改変して流用している
# https://github.com/ibmruntimes/semeru-containers/blob/ibm/11/jdk/ubuntu/jammy/Dockerfile.open.releases.full
# 原本Dockerfileのライセンス情報
# (C) Copyright IBM Corporation 2021, 2022
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

RUN set -eux; \
    unset OPENJ9_JAVA_OPTIONS; \
    SCC_SIZE="50m"; \
    \
    java -Xshareclasses:name=dry_run_scc,cacheDir=/opt/java/.scc,bootClassesOnly,nonFatal,createLayer -Xscmx$SCC_SIZE -version; \
    export OPENJ9_JAVA_OPTIONS="-Xshareclasses:name=dry_run_scc,cacheDir=/opt/java/.scc,bootClassesOnly,nonFatal"; \
    /usr/local/bin/redpen -c /usr/local/conf/redpen-conf-ja.xml /usr/local/sample-doc/ja/sampledoc-ja.md || true; \
    FULL=$( (java -Xshareclasses:name=dry_run_scc,cacheDir=/opt/java/.scc,printallStats 2>&1 || true) | awk '/^Cache is [0-9.]*% .*full/ {print substr($3, 1, length($3)-1)}'); \
    DST_CACHE=$(java -Xshareclasses:name=dry_run_scc,cacheDir=/opt/java/.scc,destroy 2>&1 || true); \
    SCC_SIZE=$(echo $SCC_SIZE | sed 's/.$//'); \
    SCC_SIZE=$(awk "BEGIN {print int($SCC_SIZE * $FULL / 100.0)}"); \
    [ "${SCC_SIZE}" -eq 0 ] && SCC_SIZE=1; \
    SCC_SIZE="${SCC_SIZE}m"; \
    java -Xshareclasses:name=openj9_system_scc,cacheDir=/opt/java/.scc,bootClassesOnly,nonFatal,createLayer -Xscmx$SCC_SIZE -version; \
    unset OPENJ9_JAVA_OPTIONS; \
    \
    export OPENJ9_JAVA_OPTIONS="-Xshareclasses:name=openj9_system_scc,cacheDir=/opt/java/.scc,bootClassesOnly,nonFatal"; \
    /usr/local/bin/redpen -c /usr/local/conf/redpen-conf-ja.xml /usr/local/sample-doc/ja/sampledoc-ja.md || true; \
    FULL=$( (java -Xshareclasses:name=openj9_system_scc,cacheDir=/opt/java/.scc,printallStats 2>&1 || true) | awk '/^Cache is [0-9.]*% .*full/ {print substr($3, 1, length($3)-1)}'); \
    echo "SCC layer is $FULL% full."; \
    if [ -d "/opt/java/.scc" ]; then \
          chmod -R 0777 /opt/java/.scc; \
    fi; \
    \
    echo "SCC generation phase completed";

ENTRYPOINT ["/usr/local/bin/redpen"]
