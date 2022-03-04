import 'package:flutter/material.dart';

class BbPage extends StatelessWidget {
  const BbPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('サンプルBページ!!'),
            OutlinedButton(
              onPressed: () {
                debugPrint('ボタン1 clicked');
              },
              child: const Text('ボタン1'),
            ),
            const SizedBox(height: 30),
            TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.green,
                ),
                onPressed: () {
                  debugPrint('ボタン2 clicked');
                },
                child: const Text('ボタン2')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
