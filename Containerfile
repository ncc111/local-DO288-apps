FROM registry.access.redhat.com/ubi8/ubi-init
LABEL version="1.0" description="this is Containerfile" maintainer="Red Hat Training <training@redhat.com>"
RUN yum -y install httpd; yum -y install net-tools; yum clean all; 
ENV PORT=1080
RUN sed -i 's/Listen 80/Listen 1080/' /usr/local/apache2/conf/httpd.conf
EXPOSE ${PORT}
RUN useradd -r -d /usr/local/apache2/htdocs/ -s /sbin/nologin webuser
RUN chown -R webuser:root /usr/local/apache2/logs/ && chgrp -R 0 /usr/local/apache2/logs/ && chmod -R g=u /usr/local/apache2/logs/
USER webuser
COPY ./public-html/ /usr/local/apache2/htdocs/
RUN systemctl enable httpd;
CMD ["httpd-foreground", "-D", "FOREGROUND", "-c", "User webuser"]
