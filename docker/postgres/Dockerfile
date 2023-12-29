FROM postgres:latest

# 引数で言語をもらう
# デフォルトはen_US
ARG DB_LANG=en_US
RUN localedef -i $DB_LANG -c -f UTF-8 -A /usr/share/locale/locale.alias $DB_LANG.UTF-8
ENV LANG $DB_LANG.utf8

# データベースの初期化用SQLファイルをコピー
COPY ./initdb.d/init.sql /docker-entrypoint-initdb.d/init.sql