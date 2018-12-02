FROM nginx
ADD dist/index.html /usr/share/nginx/html
ADD dist/static /usr/share/nginx/html
ADD nginx.conf /etc/nginx/nginx.conf
ADD /tmp/godfs /godfs
WORKDIR /
CMD "nginx && /godfs/bin/dashboard"
