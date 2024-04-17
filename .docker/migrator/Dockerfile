FROM golang:1.22

WORKDIR /app

# MySQLクライアントのインストール
RUN apt update
RUN apt install -y default-mysql-client

# マイグレーションツールのインストール
RUN go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

# マイグレーションファイルのコピー
COPY ./histories /app/histories

# マイグレーションスクリプトのコピー
COPY ./migrate.sh /app/migrate.sh

EXPOSE 3306

CMD ["sh", "migrate.sh"]