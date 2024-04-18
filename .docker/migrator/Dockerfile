FROM golang:1.22-alpine

WORKDIR /app

# マイグレーションツールのインストール
RUN go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

# マイグレーションファイルとスクリプトのコピー
COPY ./histories /app/histories
COPY ./migrate.sh /app/migrate.sh
RUN chmod +x /app/migrate.sh

# 非特権ユーザーの作成と使用
RUN adduser -D nonrootuser
USER nonrootuser

CMD ["sh", "migrate.sh"]
