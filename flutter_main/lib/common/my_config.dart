import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

part 'my_config.g.dart';

/// 環境変数の内容を保持するクラス
///
/// 使用している環境変数を全て見れるようにしておきたいため、
/// 追加があればこちらを経由して使う方針としたい。
@JsonSerializable()
class MyConfig {
  /// 紙芝居モード用の設定値（trueにすると、ユースケースをモック化するメソッドが動きます。）
  bool storyMode = false;

  /// エラー時のダイアログにスタックトレースを表示するかどうか？
  bool isViewDialogStackTrace = false;
  MyConfig();

  factory MyConfig.fromJson(Map<String, dynamic> json) =>
      _$MyConfigFromJson(json);
  Map<String, dynamic> toJson() => _$MyConfigToJson(this);
}

late final MyConfig myConfig;

/// 環境変数をコンフィグファイルに入れる
Future<MyConfig> setupMyConfig() async {
  // assetsに置いてある.env情報をloadする。
  // webの場合、Platform.environmentを指定するとエラーがスローされるので分岐している。
  if (kIsWeb) {
    await dotenv.load(fileName: 'assets/.env');
  } else {
    await dotenv.load(fileName: 'assets/.env', mergeWith: Platform.environment);
  }

  // コンフィグの設定を入れていく
  myConfig = MyConfig()
    ..storyMode = dotenv.env["STORY_MODE"] == 'true'
    ..isViewDialogStackTrace =
        dotenv.env["IS_VIEW_DIALOG_STACK_TRACE"] == 'true';

  // ignore: avoid_print
  // print('.env info: ${myConfig.toJson()}');
  _printObject(myConfig);

  return myConfig;
}

/// 標準出力時に見やすくなるように、インデント付ける処理
/// 需要があれば、util系に移動しても良い
void _printObject(Object object) {
  // Encode your object and then decode your object to Map variable
  Map jsonMapped = json.decode(json.encode(object));

  // Using JsonEncoder for spacing
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');

  // encode it to string
  String prettyPrint = encoder.convert(jsonMapped);

  // ignore: avoid_print
  print(prettyPrint);
}
