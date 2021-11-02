FROM nginx:1.15.8

RUN rm -f /etc/nginx/conf.d/*

COPY ./containers/nginx/nginx.conf /etc/nginx/nginx.conf 
COPY ./containers/nginx/default.conf /etc/nginx/conf.d/default.conf

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
