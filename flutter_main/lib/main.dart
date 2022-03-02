import 'package:flutter/material.dart';
import 'package:flutter_main/views/1_root/main_root.dart';
import 'package:flutter_main/src/3_infrastructures/flutter/story/usecase_mock.dart'
    as usecase_mock;

void main() async {
  // ignore: todo レンダリング側のエラーを補足するかどうか？検討する。
  // エラー時のデフォルトの動作は、デバッグモードで例外のメッセージを表示することである。
  // リリースビルドではグレーの背景以外何も表示されない。
  // なので、本番時にもレンダリング側のエラーを表示したい場合、下記のように設定する。
  // WidgetsFlutterBinding.ensureInitialized();
  // if (kReleaseMode) {
  //   ErrorWidget.builder = (FlutterErrorDetails details) => SomethingWrong();
  // }

  // 紙芝居のために、ユースケースをモックする。
  usecase_mock.exec();

  runApp(const MainRoot());
}
