FROM dpage/pgadmin4:latest

# 権限の設定を行うため一時的にrootユーザーに切り替える
USER root

# パッケージのインストールと設定ファイルの作成
RUN apk add --no-cache gettext && \
    touch /pgadmin4/servers.json && \
    chown -R 5050:5050 /pgadmin4/servers.json

# 設定ファイルのテンプレートをコピー
COPY servers.json.template /pgadmin4/servers.json.template

# ユーザーを戻す
USER 5050

# 設定ファイルのテンプレートを環境変数を用いて置換し、起動時に実行する
ENTRYPOINT ["sh", "-c", "envsubst < /pgadmin4/servers.json.template > /pgadmin4/servers.json && /entrypoint.sh"]