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
    // サービスロケータパターンよりも型チェックが効くが見た目ごつい感じ。
    var resultbk = await wrap.exec(user_usecase.userInfo, () {
      return user_usecase.userInfo('');
    });
    print(resultbk);

    // サービスロケータパターン
    // 型チェックが効かなくなるが、ログなど見やすく出せると思われるパターン。
    var result = await container.get("/user/info")("uuu");
    setState(() {
      str = result;
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
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
