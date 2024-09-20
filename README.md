# basic-web
公開用 サンプル chef レシピ

## 対象OS
Amazon Linux

## レシピの内容
nginx 構成
tomcat 構成

## このレシピの作り方

$ knife configure

$ knife solo init basic-web

バッチとWEB用の cookbook を作成する
$ knife cookbook create web-server -o site-cookbooks
$ knife cookbook create batch-server -o site-cookbooks

## このレシピの利用方法

## 1. インストール先サーバーを下ごしらえする
- Amazon EC2 起動

- knife prepare で chef の材料を転送する

## 2. batch サーバーを作成する
- パッケージのインストール レシピ実行
- 構成変更と反映レシピ実行
- nginx + rundeck、jenkins を構成する

## 3. batch サーバーから web サーバーを複数作成する
- パッケージのインストール レシピ実行
- 構成変更と反映レシピ実行
- nginx + tomcat を構成する

## 3. 動作確認する

2024/09/20.
