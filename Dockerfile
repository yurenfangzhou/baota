ARG CENTOS_VERSION
FROM centos:${CENTOS_VERSION}
LABEL maintainer="ifui <ifui@foxmail.com>"

ARG BAOTA_INSTALL_PATH
# install pkg
RUN yum install -y wget \
    && yum install -y ca-certificates

# install baota
RUN set -e \
    && wget -O install.sh ${BAOTA_INSTALL_PATH} \
    && echo y | sh install.sh

COPY ./DockerScript /www/DockerScript

CMD [ "/www/DockerScript/init.sh" ]

EXPOSE 8888 80 443 20 21 22