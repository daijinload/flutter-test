# flutter_main

スクショを取りたいのであれば、公式ドキュメントを参考に、Androidエミュレータのセットアップをすること。

## setup

```bash

# 環境変数ファイルをコピーする（環境変数をコマンドラインで設定している場合、.envの値が上書きされます。）
cp flutter_main/assets/.env.sample flutter_main/assets/.env

flutter pub get

# wasm セットアップ
# dart run wasm:setup

flutter analyze
flutter test

# 単品実行
flutter test test/widget/aaa_widget_test.dart

# format
flutter format lib/*

# おかしくなったらクリーンする
flutter clean
```

## json server

```bash
node http-json-server.js
```
