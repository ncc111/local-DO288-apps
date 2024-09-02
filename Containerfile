FROM httpd:2.4
ENV PORT=8080
EXPOSE ${PORT}
COPY ./public-html/ /usr/local/apache2/htdocs/
