FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
ENV PORT=8080
EXPOSE ${PORT}
