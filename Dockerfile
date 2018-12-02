FROM nginx
ADD dist/index.html /usr/share/nginx/html
ADD dist/static /usr/share/nginx/html
ADD nginx.conf /etc/nginx/nginx.conf
WORKDIR /
CMD "nginx && /godfs/bin/dashboard"
