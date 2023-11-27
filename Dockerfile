FROM pihole/pihole:v5.8.1
RUN apt update && apt install -y unbound
RUN apt install -y vim
RUN apt install -y rsyslog

RUN rm /etc/unbound/unbound.conf
RUN mv /etc/rsyslog.conf /etc/rsyslog.conf.ORIG

COPY lighttpd-external.conf /etc/lighttpd/external.conf 
COPY unbound-pihole.conf /etc/unbound/unbound.conf
COPY z_custom.conf /etc/unbound/unbound.conf.d/z_custom.conf
COPY rsyslog.conf /etc/rsyslog.conf
COPY mainEngine.sh /mainEngine.sh

RUN chmod +x /mainEngine.sh
ENTRYPOINT /mainEngine.sh
