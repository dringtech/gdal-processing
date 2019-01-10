FROM fedora:29
MAINTAINER Giles Dring <giles@dringtech.com>

RUN mkdir /process
WORKDIR /process

RUN dnf install gdal --assumeyes && dnf clean all
COPY script.sh /process

CMD ["/bin/sh", "/process/script.sh"]
