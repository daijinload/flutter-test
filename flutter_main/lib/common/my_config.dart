import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_config.g.dart';

/// インテグレーションテスト実行時に、flutterがアセットloadを
/// 出来なくするので、回避策としてテストでは下記から読み込むこととする。
/// （下記のユニットテスト系セットアップだと動いたが。。。）
/// ```dart
/// TestWidgetsFlutterBinding.ensureInitialized();
/// ```
/// 別件だが下記の書き方だと、通常時にもメモリに読み込まれてしまうので、
/// 増えてきたら関数とかにして遅延ロードするのもいいかと。
const testEnv = '''
STORY_MODE=true
IS_VIEW_DIALOG_STACK_TRACE=true
''';

/// こちらを参照する。
late final MyConfig myConfig;

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

/// 環境変数をコンフィグファイルに入れる
Future<MyConfig> setupMyConfig({bool isTest = false}) async {
  // assetsに置いてある.env情報をloadする。
  // テスト実行時は、ファイルからloadできないので読み込みを分ける。
  if (isTest) {
    dotenv.testLoad(fileInput: testEnv);
  } else {
    await dotenv.load(fileName: 'assets/.env');
  }
  final Map<String, String> map = dotenv.env;

  // コンフィグの設定を入れていく
  myConfig = MyConfig()
    ..storyMode = map["STORY_MODE"] == 'true'
    ..isViewDialogStackTrace = map["IS_VIEW_DIALOG_STACK_TRACE"] == 'true';

  // 内容を標準出力に表示する（パスワードなどはサニタイズして表示する）
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
