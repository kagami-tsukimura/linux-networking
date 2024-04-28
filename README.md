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

## Docker の起動

```bash
# mountしたデータが削除されないようにする
# -v: ホストのカレントディレクトリをコンテナの/opt/myappにマウント
# -w: コンテナのカレントディレクトリを/opt/myappに設定
# docker run -it -v $PWD:/opt/myapp -w /opt/myapp my-ruby:dockerfile bash
# -d: バックグラウンド実行
# -p: ホストのポート番号をコンテナのポート番号にマウント
# -o: コンテナのホストのIPアドレスを0.0.0.0に設定 →4567ポートのIPに対してアクセス可能
docker run -v $PWD/sinatra:/opt/myapp -w /opt/myapp -d -p 4567:4567 my-ruby:dockerfile ruby myapp.rb -o 0.0.0.0
```

## mysql コンテナの起動

```bash
docker run --name my-db -e MYSQL_ROOT_PASSWORD=rootpassword -d --platform linux/x86_64 mysql:8.0.29
```
