import 'package:flutter/material.dart';

// メインページ　主に各ページのリンクを置いておくだけ。
class MainPage extends StatelessWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createTextButton(context, '/a', 'a画面へ'),
            const SizedBox(height: 30),
            createTextButton(context, '/b', 'b画面へ'),
            const SizedBox(height: 30),
            createTextButton(context, '/user/info', 'ユーザ画面へ'),
          ],
        ),
      ),
    );
  }
}

// テキストボタンを作成する
TextButton createTextButton(BuildContext context, String path, String txt) {
  return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        primary: Colors.green,
      ),
      onPressed: () {
        Navigator.pushNamed(context, path);
      },
      child: Text(txt),
  );
}
