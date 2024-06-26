         ___        ______     ____ _                 _  ___
        / \ \      / / ___|   / ___| | ___  _   _  __| |/ _ \
       / _ \ \ /\ / /\___ \  | |   | |/ _ \| | | |/ _` | (_) |
      / ___ \ V  V /  ___) | | |___| | (_) | |_| | (_| |\__, |
     /_/   \_\_/\_/  |____/   \____|_|\___/ \__,_|\__,_|  /_/

---

Hi there! Welcome to AWS Cloud9!

To get started, create some files, play with the terminal,
or visit https://docs.aws.amazon.com/console/cloud9/ for our documentation.

Happy coding!

## MySQL メモ

- 設定ファイルの確認方法
  - 下記コマンドで確認

```bash
sudo cat /etc/mysql/debian.cnf
```

- MySQL のログイン
  - 下記コマンドでログイン

```bash
mysql -u <上記設定ファイルのuser> -p
# e.g. mysql -u debian-sys-maint -p
```

```bash
※Enter password: <上記設定ファイルの password>
# e.g. Enter password: P6X6kUSHDeUQYu8I
```

- MySQL の実体は、mysql の service
  - mysql コマンドでは、実体にアクセスするためのツール

## Dockerfile による起動

### docker network の作成

```bash
docker network create my-net
```

### sinatra の起動

```bash
# mountしたデータが削除されないようにする
# -v: ホストのカレントディレクトリをコンテナの/opt/myappにマウント
# -w: コンテナのカレントディレクトリを/opt/myappに設定
# docker run -it -v $PWD:/opt/myapp -w /opt/myapp my-ruby:dockerfile bash
# -d: バックグラウンド実行
# -p: ホストのポート番号をコンテナのポート番号にマウント
# -o: コンテナのホストのIPアドレスを0.0.0.0に設定 →4567ポートのIPに対してアクセス可能

cd introduction-to-docker/sinatra
docker build -t my-ruby:dockerfile .
cd ..
docker run -v $PWD/sinatra:/opt/myapp -w /opt/myapp -d -p 4567:4567 --net my-net my-ruby:dockerfile ruby myapp.rb -o 0.0.0.0
```

### mysql コンテナの起動

```bash
cd introduction-to-docker
docker run --name my-db -e MYSQL_ROOT_PASSWORD=rootpassword -d --platform linux/x86_64 -v $PWD/mysql/docker-entrypoint-initdb.d:/docker-entrypoint-initdb.d -v $PWD/mysql/conf.d/charaset.cnf:/etc/mysql/conf.d/charaset.cnf --net my-net  mysql:8.0.29
```

#### mysql コンテナの確認

```bash
docker exec -it my-db bash
mysql -u root -p
rootpassword
```

#### mysql コンテナの起動時について

起動時に`/docker-entrypoint-initdb`.内の`d.sh`, `.sql` , `.sql.gz`を読み込ませられる。

#### mysql テーブル確認

```bash
show databases;
use mydb;
show tables;
select * from tasks;
```

## docker-compose による起動

- nginx, sinatra, mysql コンテナの起動
  - nginx はポート 8000 でアクセス可能
  - sinatra はポート 4567 でアクセス可能
  - mysql はポート 3306 でアクセス可能

```bash
cd introduction-to-docker
docker-compose up -d
```

### Docker イメージを書き換えた場合

```bash
docker-compose build
docker-compose up -d
```
