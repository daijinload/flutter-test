import 'package:flutter/material.dart';
import 'package:flutter_main/views/2_page/user_page.dart';
import 'package:flutter_test/flutter_test.dart';

// flutter test test/views/2_page/user_page_test.dart

// widgetのテストツールでボタン押下時に非同期処理を使うと、
// 非同期処理コールで止まってしまいデータが取得できない。
// 起動して動かすと非同期関数も実行できてデータも取得できているのでテストツール側のバグっぽい。
// 直ったら移行するのも良いかもしれないが、下記のやり方のほうが
// より低レイヤでシンプルなので、移行しなくてもいいかなぁと思ったりもする。

late UserPageState state;

class MainRoot extends StatelessWidget {
  const MainRoot({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    const home = UserPage(title: "");
    state = home.createElement().state as UserPageState;
    return const MaterialApp(
      title: 'Flutter Demo',
      home: home,
    );
  }
}

void main() {
  // late UserPageState state;
  setUpAll(() {
    state = const UserPage(title: "").createElement().state as UserPageState;
  });
  group('ユーザ情報表示テスト', () {
    test('初回は空文字で表示すること', () {
      expect("", state.str);
    });
    test('ボタンを押したら、json文字列が表示されること', () async {
      await state.onPressedUserInfo();
      expect('{"name":"hello"}', state.str);
    });
  });
}
