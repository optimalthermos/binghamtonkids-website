FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy nginx config template (uses $PORT env var)
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Copy site files
COPY . /usr/share/nginx/html

# Railway sets PORT env var — nginx envsubst auto-processes templates
# Default to 8080 if PORT not set
ENV PORT=8080
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
