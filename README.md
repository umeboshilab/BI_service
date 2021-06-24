# README

Dockerのコンテナの作成方法（？）

1. Dockerの起動

2. 下記のコマンドを実行

railsがないときの環境構築時だけ
```
docker-compose run web rails new . --force --no-deps --database=mysql --skip-bundle --rm
docker-compose run web bundle exec rails webpacker:install
```

githubからcloneしてきたときはrailsがあるので、下記のコマンドのみでいいはず。

```
docker-compose build
docker-compose up
```

<br>  

3. 終了するとき実行

```
docker-compose down
```



※Dockerfileの内容を変更したときは下記のコマンドで更新するらしい
docker-compose up --build //dockerfileの編集時

docker-compose down --rmi all && docker-compose up --build