import 'package:flutter/material.dart';
import 'package:flutter_main/views/1_root/main_root.dart';

void main() async {
  // ignore: todo レンダリング側のエラーを補足するかどうか？検討する。
  // エラー時のデフォルトの動作は、デバッグモードで例外のメッセージを表示することである。
  // リリースビルドではグレーの背景以外何も表示されない。
  // なので、本番時にもレンダリング側のエラーを表示したい場合、下記のように設定する。
  // WidgetsFlutterBinding.ensureInitialized();
  // if (kReleaseMode) {
  //   ErrorWidget.builder = (FlutterErrorDetails details) => SomethingWrong();
  // }
  runApp(const MainRoot());
}
