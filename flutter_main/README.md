# flutter_main

スクショを取りたいのであれば、公式ドキュメントを参考に、Android エミュレータのセットアップをすること。

## setup

```bash

# 環境変数ファイルをコピーする（環境変数をコマンドラインで設定している場合、.envの値が上書きされます。）
cp flutter_main/assets/.env.sample flutter_main/assets/.env

flutter pub get

# GraphQLのアルテミスモジュールと、クラスのtoJsonメソッドを自動生成するために使用している。
flutter pub run build_runner build --delete-conflicting-outputs

# wasm セットアップ
# dart run wasm:setup

flutter analyze
flutter test

# 単品実行
flutter test -d linux test/integration_test/views/2_page/user_page_test.dart

# format
flutter format lib/*
flutter format test/*
flutter format integration_test/*

# おかしくなったらクリーンする
flutter clean
```

## format とテストをするチェック用スクリプト

```bash
./script/check.sh
```

## json server

```bash
node http-json-server.js
```

## デザイン一覧画面について

### 概要

- 再利用可能なコンポーネントがカタログ形式で見ることが可能
- コンポーネントの使用方法とその意図を第三者が理解しやすいように作成

### 機能

- コンポーネント名を押すと import path がクリップボードにコピーされる
