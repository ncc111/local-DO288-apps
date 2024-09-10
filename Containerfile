FROM registry.access.redhat.com/ubi8/ubi:8.0
MAINTAINER Red Hat Training <training@redhat.com>
# DocumentRoot for Apache
ENV DOCROOT=/var/www/html
RUN yum install -y --disableplugin=subscription-manager httpd && yum clean all --disableplugin=subscription-manager -y && echo "Hello from the httpd-parent container!" > ${DOCROOT}/index.html
# Allows child images to inject their own content into DocumentRoot
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
ONBUILD COPY src/ ${DOCROOT}/
EXPOSE 8080
# This stuff is needed to ensure a clean start
RUN rm -rf /run/httpd && mkdir /run/httpd
# Run as the root user
USER root
# Launch httpd
CMD /usr/sbin/httpd -DFOREGROUND
