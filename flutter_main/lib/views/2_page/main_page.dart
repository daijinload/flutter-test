import 'package:flutter/material.dart';
import 'package:flutter_main/views/4_component/text_button.dart';

// メインページ　主に各ページのリンクを置いておくだけ。
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サンプルページへのリンクページ'),
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
            const SizedBox(height: 30),
            createTextButton(context, '/user/home', 'ホーム画面へ'),
            const SizedBox(height: 30),
            createTextButton(context, '/designs', 'デザイン画面へ'),
          ],
        ),
      ),
    );
  }
}
