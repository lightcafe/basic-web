# basic-web
公開用 サンプル chef レシピ

## 対象OS
Amazon Linux

## レシピの内容
nginx 構成
tomcat 構成

## chef リポジトリを作成する

$ knife configure

$ knife solo init basic-web

## 利用方法

## 1. インストール先サーバーを下ごしらえする
- Amazon EC2 起動

- knife prepare で chef の材料を転送する

## 2. web サーバーを作成する
- パッケージのインストール レシピ実行
- 構成変更と反映レシピ実行

## 3. 動作確認する
