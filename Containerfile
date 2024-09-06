FROM httpd:2.4
LABEL version="1.0" description="this is Containerfile" maintainer="Red Hat Training <training@redhat.com>"
ENV PORT=8080
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf
EXPOSE ${PORT}
RUN yum -y install net-tools
RUN useradd -r -d /usr/local/apache2/htdocs/ -s /sbin/nologin webuser
RUN chown -R webuser:root /usr/local/apache2/logs/ && chgrp -R 0 /usr/local/apache2/logs/ && chmod -R g=u /usr/local/apache2/logs/
RUN touch /usr/local/apache2/logs/aa.log
USER webuser
COPY ./public-html/ /usr/local/apache2/htdocs/
RUN touch /usr/local/apache2/logs/bb.log
CMD ["httpd-foreground", "-D", "FOREGROUND", "-c", "User webuser"]
