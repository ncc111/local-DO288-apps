FROM httpd:2.4
ENV PORT=8080
EXPOSE ${PORT}

# Create a non-root user
RUN useradd -r -d /usr/local/apache2/htdocs/ -s /sbin/nologin webuser

# Change ownership of the document root directory
RUN chown -R webuser:webuser /usr/local/apache2/htdocs/

# Switch to the non-root user
USER webuser

# Copy website files
COPY ./public-html/ /usr/local/apache2/htdocs/

# Run Apache on the specified port
CMD ["httpd-foreground", "-D", "FOREGROUND", "-k", "start", "-DFOREGROUND", "-c", "Listen ${PORT}"]
