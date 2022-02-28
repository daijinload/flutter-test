import 'package:flutter/material.dart';
import 'package:flutter_main/src/1_usecases/user_usecase.dart' as user_usecase;
import 'package:flutter_main/src/1_usecases/wrap.dart' as wrap;

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<UserPage> createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  String str = "";

  Future<void> onPressedUserInfo() async {
    // デコレータパターン
    // サービスロケータパターンよりも型チェックが効くが見た目ごついし、
    // 実行関数とパラメータを渡さないと、何がどのパラメータで実行されている？
    // というログは取れないパターンとなる。
    // コンテナ側にコードを追記していく作業は無くなるし、
    // IDEでの関数コール検索ができ、使っている箇所の特定が容易になる。
    // データのモック化まで考慮に入れると、execにモック処理を書く必要はあるかと。
    var result = await wrap.exec(user_usecase.userInfo, () {
      return user_usecase.userInfo('');
    });
    setState(() {
      str = result;
    });

    // alertの表示！！
    await _showMyDialog(context, 'アラートダイアログタイトル🌠', 'ここに、アラートメッセージが入ります。', () {
      setState(() {
        str = '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ボタンを押したらJSON文字が表示されます。',
            ),
            Text(
              str,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressedUserInfo,
        //tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<void> _showMyDialog(
    BuildContext ctx, String title, String message, Function onPressedOk,
    [Function? onPressedNg]) async {
  return await showDialog<void>(
    context: ctx,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('文字そのまま'),
            onPressed: () {
              if (onPressedNg != null) {
                onPressedNg();
              }
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: const Text('文字クリア'),
            onPressed: () {
              onPressedOk();
              Navigator.of(ctx).pop();
            },
          ),
        ],
      );
    },
  );
}
