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
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Bページ!!'),
          ],
        ),
      ),
    );
  }
}
