FROM ubuntu:16.04
RUN echo -e '\nLC_ALL="en_US.UTF-8"\nLANG="en_US.UTF-8"\nLANGUAGE="en_US.UTF-8"\nLC_CTYPE="UTF-8"\n' >> /etc/environment
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y htop ncdu p7zip-full testdisk genisoimage ext3grep extundelete ext4magic axel foremost scalpel xfsprogs lvm2 apt-utils
RUN apt-get install -y clang++ cmake make automake autoconf zlib1g-dev
RUN cd /root && wget http://dl.eventql.io/eventql/v0.4.1/eventql-0.4.1-linux_x86_64.tgz -o eventql-0.4.1-linux_x86_64.tgz
RUN cd / && tar xzf /root/eventql-0.4.0-rc0-linux_x86_64.tgz
RUN echo -e '[client]\nhost = localhost ; execute queries on this server\n[server]\ndatadir = /var/lib/eventql\nlisten = 0.0.0.0:9175\npidfile = /var/run/\ndaemonize = true\n' > /etc/evqld.conf
EXPOSE 9175
RUN exec /usr/local/bin/evqld
