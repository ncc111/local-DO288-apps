FROM httpd:2.4
ENV PORT=8080
EXPOSE ${PORT}
USER root
COPY ./public-html/ /usr/local/apache2/htdocs/
