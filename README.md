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
docker run -it -v $PWD:/opt/myapp my-ruby:dockerfile bash
```
