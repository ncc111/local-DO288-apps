FROM httpd:2.4
ENV PORT=8080
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf
EXPOSE ${PORT}
RUN useradd -r -d /usr/local/apache2/htdocs/ -s /sbin/nologin webuser
RUN chown -R webuser:webuser /usr/local/apache2/logs/
USER webuser
COPY ./public-html/ /usr/local/apache2/htdocs/
CMD ["httpd-foreground"]
