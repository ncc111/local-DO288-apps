FROM httpd:2.4
ENV PORT=8080
EXPOSE ${PORT}
RUN useradd -r -d /usr/local/apache2/htdocs/ -s /sbin/nologin webuser
USER webuser
COPY ./public-html/ /usr/local/apache2/htdocs/
CMD ["httpd-foreground", "-D", "FOREGROUND", "-k", "start", "-DFOREGROUND", "-c", "Listen ${PORT}"]
