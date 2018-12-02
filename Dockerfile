FROM nginx
ADD dist/index.html /usr/share/nginx/html
ADD dist/static /usr/share/nginx/html/static
ADD nginx.conf /etc/nginx/nginx.conf
ADD godfs/godfs /godfs
WORKDIR /
CMD sh -c "nginx && /godfs/bin/dashboard"
