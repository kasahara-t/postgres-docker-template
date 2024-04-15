FROM dpage/pgadmin4:latest

# 権限の設定を行うため一時的にrootユーザーに切り替える
USER root

# パッケージのインストールと設定ファイルの作成
RUN apk add --no-cache gettext

# 設定ファイルの作成
RUN touch /pgadmin4/servers.json && \
    chown 5050:5050 /pgadmin4/servers.json

# 設定ファイルのテンプレートをコピー
COPY servers.json.template /templates/servers.json.template

# 起動時に実行するスクリプトをコピー
COPY --chown=5050:5050 substitute-vars.sh /substitute-vars.sh
COPY --chown=5050:5050 custom-entrypoint.sh /custom-entrypoint.sh
RUN chmod u+x /substitute-vars.sh && \
    chmod u+x /custom-entrypoint.sh

# ユーザーを戻す
USER 5050

# 設定ファイルのテンプレートを環境変数を用いて置換し、起動時に実行する
ENTRYPOINT ["sh", "/custom-entrypoint.sh"]
