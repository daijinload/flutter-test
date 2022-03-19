import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

/// 環境変数の内容を保持するクラス
/// 
/// 使用している環境変数を全て見れるようにしておきたいため、
/// 追加があればこちらを経由して使う方針としたい。
class MyConfig {
  bool storyMode = false;
  bool isViewDialogStackTrace = false;
  MyConfig();
}

late MyConfig myConfig;

Future<MyConfig> setupConfig() async {
  myConfig = MyConfig()
  ..storyMode = dotenv.env["STORY_MODE"] == 'true'
  ..isViewDialogStackTrace = dotenv.env["IS_VIEW_DIALOG_STACK_TRACE"] == 'true';
  return myConfig;
}

void printObject(Object object) {
  // Encode your object and then decode your object to Map variable
  Map jsonMapped = json.decode(json.encode(object)); 

  // Using JsonEncoder for spacing
  const JsonEncoder encoder = JsonEncoder.withIndent('  '); 

  // encode it to string
  String prettyPrint = encoder.convert(jsonMapped); 

  // ignore: avoid_print
  print(prettyPrint); 
}
