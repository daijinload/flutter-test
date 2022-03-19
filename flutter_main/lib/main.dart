import 'package:flutter/material.dart';
import 'package:flutter_main/common/my_config.dart';
import 'package:flutter_main/views/1_root/main_root.dart';
import 'package:flutter_main/src/3_infrastructures/flutter/story/usecase_mock.dart'
    as usecase_mock;
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

  // 環境変数をコンフィグファイルに入れる
  final myConfig = await setupMyConfig();

  // webで起動した場合に、/#/hogeというパスが、/hogeとシンプルになる。
  setPathUrlStrategy();

  // 紙芝居のために、ユースケースをモックする。
  if (myConfig.storyMode) {
    usecase_mock.exec();
  }

  runApp(const MainRoot());
}
