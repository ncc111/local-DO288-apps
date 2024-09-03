FROM httpd:2.4
LABEL version=”1.0” description=”this is Containerfile” maintainer=”Red Hat Training <training@redhat.com>”
ENV PORT=8080
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf
EXPOSE ${PORT}
RUN useradd -r -d /usr/local/apache2/htdocs/ -s /sbin/nologin webuser
RUN chown -R webuser:root /usr/local/apache2/logs/ && chmod 775 /usr/local/apache2/logs/
USER webuser
COPY ./public-html/ /usr/local/apache2/htdocs/
RUN touch /usr/local/apache2/logs/aaa.log
CMD ["httpd-foreground", "-D", "FOREGROUND", "-c", "User webuser"]
