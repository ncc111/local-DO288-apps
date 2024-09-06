FROM ubi8
LABEL version="1.0" description="this is Containerfile" maintainer="Red Hat Training <training@redhat.com>"
RUN yum -y install httpd; yum -y install net-tools; yum clean all; 
RUN useradd -r -d /usr/local/apache2/htdocs/ -s /sbin/nologin webuser
RUN chown -R webuser:root /usr/local/apache2/logs/ && chgrp -R 0 /usr/local/apache2/logs/ && chmod -R g=u /usr/local/apache2/logs/
USER webuser
