# PostgreSQLとpgAdminのDocker環境

このリポジトリは、PostgreSQLデータベースとpgAdmin管理ツールをDockerコンテナとしてセットアップするためのものです。

## ディレクトリ構成

```
├── docker
│   ├── pgadmin
│   │   ├── Dockerfile
│   │   └── servers.json.template
│   └── postgres
│       ├── Dockerfile
│       └── initdb.d
│           └── init.sql
├── README.md
├── .env.dist
└── docker-compose.yaml
```

## 使用方法

1. `.env.dist` ファイルを `.env` にコピーし、必要に応じて内容を編集します。
   ```bash
   cp .env.dist .env
   ```

## Tips

### ボリュームの削除

Docker Composeで作成したボリュームを削除するには、次のコマンドを使用します：

```bash
docker compose down -v
```

### コンテナの状態確認 (psコマンド)

Docker Composeで管理されているコンテナの状態を確認するには、以下のコマンドを使用します：

```bash
docker compose ps
```

### ログの確認 (logsコマンド)
Docker Composeで管理されているコンテナのログを確認するには、以下のコマンドを使用します：

```bash
docker-compose logs
```

特定のコンテナのログのみを表示したい場合は、コンテナ名を指定します：

```bash
docker-compose logs [コンテナ名]
```

例えば、PostgreSQLコンテナのログのみを確認するには、以下のようにします：

```bash
docker-compose logs db
```

このコマンドは、指定されたコンテナのログを表示します。これにより、エラーや警告、その他の実行時の出力を確認することができます。

## docker-compose.yamlの概要

このファイルは、PostgreSQLとpgAdminの両方のコンテナを定義しています。PostgreSQLコンテナは独自のDockerfileを使用してビルドされ、pgAdminコンテナは公式のpgAdmin4イメージをベースにカスタマイズされています。

### PostgreSQLコンテナ

- ビルド: `./docker/postgres/Dockerfile`を使用
- 環境変数: ポート、データベース名、ユーザー名、パスワードなど
- ボリューム: `db-store`をデータ保存用に使用
- ヘルスチェック: `pg_isready` コマンドを使用してデータベースの状態をチェック

### pgAdminコンテナ

- ビルド: `./docker/pgadmin/Dockerfile`を使用
- 環境変数: デフォルトのメールアドレス、パスワード、PostgreSQL関連の設定など
- ボリューム: `pgadmin-store`をデータ保存用に使用
- ヘルスチェック: `wget`を使用してpgAdminの状態をチェック
- 依存関係: PostgreSQLコンテナがヘルシー状態になるのを待ってから起動

## ネットワーク

`pgadmin-network` ネットワークを通じて、PostgreSQLとpgAdminコンテナが通信します。

## カスタマイズ

このリポジトリはカスタマイズ可能です。必要に応じてDockerfileやdocker-compose.yamlを編集してください。
