import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_main/common/config.dart';
import 'package:flutter_main/views/1_root/main_root.dart';
import 'package:flutter_main/src/3_infrastructures/flutter/story/usecase_mock.dart'
    as usecase_mock;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_strategy/url_strategy.dart';

void main() async {
  // ignore: todo レンダリング側のエラーを補足するかどうか？検討する。
  // エラー時のデフォルトの動作は、デバッグモードで例外のメッセージを表示することである。
  // リリースビルドではグレーの背景以外何も表示されない。
  // なので、本番時にもレンダリング側のエラーを表示したい場合、下記のように設定する。
  // WidgetsFlutterBinding.ensureInitialized();
  // if (kReleaseMode) {
  //   ErrorWidget.builder = (FlutterErrorDetails details) => SomethingWrong();
  // }

  // ignore: todo 最終的には使っている環境編数をクラス化して表現して、
  // 起動時に表示するのと、内部を見ないと何を使っているのか？わからない状況を改善したい。
  if (kIsWeb) {
    await dotenv.load(fileName: 'assets/.env');
  } else {
    await dotenv.load(fileName: 'assets/.env', mergeWith: Platform.environment);
  }
  // 環境変数をコンフィグファイルに移し替える
  final config = await setupConfig();
  // ignore: avoid_print
  printObject(config);

  // webで起動した場合に、/#/hogeというパスが、/hogeとシンプルになる。
  setPathUrlStrategy();

  // 紙芝居のために、ユースケースをモックする。
  if (dotenv.env["STORY_MODE"] == 'true') {
    usecase_mock.exec();
  }

  runApp(const MainRoot());
}
