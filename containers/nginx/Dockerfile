FROM nginx:1.15.8

# インクルード用のディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*

# Nginxの設定ファイルをコンテナにコピー
COPY ./containers/nginx/nginx.conf /etc/nginx/nginx.conf 
# COPY ./containers/nginx/default.conf /etc/nginx/conf.d/default.conf

# ビルド完了後にNginxを起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
