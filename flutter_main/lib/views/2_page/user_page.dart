import 'package:flutter/material.dart';
import 'package:flutter_main/src/1_usecases/container.dart' as container;
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
    // 起動時に書くべきだが、サンプルなので、ここでセットアップする
    container.setUp();

    // デコレータパターン
    // サービスロケータパターンよりも型チェックが効くが見た目ごついし、
    // 実行関数とパラメータを渡さないと、何がどのパラメータで実行されている？
    // というログは取れないパターンとなる。
    // コンテナ側にコードを追記していく作業は無くなるし、
    // IDEでの関数コール検索ができ、使っている箇所の特定が容易になる。
    // データのモック化まで考慮に入れると、execにモック処理を書く必要はあるかと。
    var resultbk = await wrap.exec(user_usecase.userInfo, () {
      return user_usecase.userInfo('');
    });
    print(resultbk);

    // サービスロケータパターン
    // 型チェックが効かなくなるが、ログなど見やすく出せると思われるパターン。
    // コンテナ側にユースケースを作成するたびに追加しなければならず、大きくなる。
    // リフレクションで取ってこようとしたが、それだと全てのコードが必要になりカリングができず、
    // バイナリサイズが大きくなる的な話があったため、importを地道に書くことにした。
    var result = await container.get("/user/info")("uuu");
    setState(() {
      str = result;
    });

    _showMyDialog(context);
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
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}