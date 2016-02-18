FROM ubuntu:15.10

MAINTAINER Jake Pelletier <ghjnut@gmail.com>

# necessart for handling encoding
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mkdir /opt/deluge
WORKDIR /opt/deluge

RUN apt-get update \
	&& apt-get install -y \
		python python-twisted python-openssl python-setuptools intltool python-xdg \
		python-chardet geoip-database python-libtorrent python-notify python-pygame \
		python-glade2 librsvg2-common xdg-utils python-mako \
		wget \
		tar \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://download.deluge-torrent.org/source/deluge-1.3.12.tar.gz -O - | tar -xz \
	&& cd deluge-1.3.12 \
	&& python setup.py build \
	&& python setup.py install \
	&& cd .. \
	&& rm -rf /opt/deluge/deluge-1.3.12
	#&& python setup.py install_data

#EXPOSE 58846 58946

#ENTRYPOINT ["/usr/local/bin/deluged", "-d"]
#CMD ["-L", "info"]
