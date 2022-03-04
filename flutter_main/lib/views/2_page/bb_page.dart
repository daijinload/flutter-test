import 'package:flutter/material.dart';

class BbPage extends StatelessWidget {
  const BbPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Bページ!!'),
          ],
        ),
      ),
    );
  }
}
