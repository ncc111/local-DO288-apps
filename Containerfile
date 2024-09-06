FROM ubi8
LABEL version="1.0" description="this is Containerfile" maintainer="Red Hat Training <training@redhat.com>"
RUN yum -y install httpd; yum -y install net-tools; yum clean all; 
RUN useradd -r -d /usr/local/apache2/htdocs/ -s /sbin/nologin webuser
USER webuser
CMD /usr/sbin/httpd -DFOREGROUND
