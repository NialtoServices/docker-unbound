# syntax=docker/dockerfile:1
#
# Copyright 2025 Nialto Services Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM alpine:3.21

LABEL org.opencontainers.image.description="Unbound"
LABEL org.opencontainers.image.licenses="Apache-2.0"
LABEL org.opencontainers.image.source="https://github.com/NialtoServices/docker-unbound"

ARG UNBOUND_VERSION="1.22.0"

RUN apk upgrade --no-cache
RUN apk add --no-cache ca-certificates tini unbound~=$UNBOUND_VERSION

COPY bin/bootstrap /usr/local/sbin/bootstrap
COPY unbound/unbound.conf /etc/unbound/unbound.conf

RUN \
mkdir -p /var/lib/unbound && \
chown unbound:unbound /var/lib/unbound && \
chmod 755 /var/lib/unbound

ENTRYPOINT ["/usr/local/sbin/bootstrap"]

VOLUME ["/var/lib/unbound"]

EXPOSE 53/tcp
EXPOSE 53/udp
