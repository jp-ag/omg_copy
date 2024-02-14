# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM jenkins:2.46.1 as chroot

COPY jenkins-cli.jar /

USER root
RUN echo 'deb http://archive.debian.org/debian/ jessie main' >> /etc/apt/sources.list
RUN apt-get update; exit 0
RUN apt-get install socat -y --force-yes; exit 0
COPY start.sh /start.sh
RUN chmod +777 /start.sh
RUN chown -Rc jenkins /var/jenkins_home
VOLUME /tmp


FROM gcr.io/kctf-docker/challenge@sha256:0f7d757bcda470c3bbc063606335b915e03795d72ba1d8fdb6f0f9ff3757364f

COPY --from=chroot / /chroot

VOLUME /chroot/var/jenkins_home/



COPY nsjail.cfg /home/nsjail.cfg

    CMD kctf_setup \
        && (kctf_drop_privs nsjail --config /home/nsjail.cfg --port 1337 -- /start.sh)