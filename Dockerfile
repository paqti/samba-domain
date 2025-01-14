FROM ubuntu:jammy
MAINTAINER Fmstrat <fmstrat@NOSPAM.NO>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:linux-schools/samba-latest
RUN apt-get update && apt upgrade -y

# Install all apps
# The third line is for multi-site config (ping is for testing later)
RUN apt-get install -y pkg-config
RUN apt-get install -y attr acl samba smbclient ldap-utils winbind libnss-winbind libpam-winbind krb5-user krb5-kdc supervisor
RUN apt-get install -y openvpn inetutils-ping

# Set up script and run
ADD init.sh /init.sh
RUN chmod 755 /init.sh
CMD /init.sh setup
