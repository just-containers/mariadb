FROM quay.io/glerchundi/base:0.1.3
MAINTAINER Gorka Lerchundi Osa <glertxundi@gmail.com>

##
## INSTALL
##

# adding the MariaDB 10.0 repository using the primary MariaDB mirror and Ubuntu 14.04 "trusty"
RUN apt-key-min adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
    add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu trusty main'

# install mariadb
RUN apt-get-min update                 && \
    apt-get-install-min mariadb-server

##
## ROOTFS
##

# root filesystem
COPY rootfs /

# volumes
VOLUME [ "/volumes/data", "/volumes/log" ]

##
## CLEANUP
##

RUN apt-cleanup
