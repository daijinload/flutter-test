import 'package:flutter/material.dart';
import 'package:flutter_main/src/1_usecases/container.dart' as container;

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<UserPage> createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  String str = "";

  Future<void> userInfo() async {
    // 起動時に書くべきだが、サンプルなので、ここでセットアップする
    container.setUp();

    // コントローラを取得して、httpリクエストする
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
        onPressed: userInfo,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
