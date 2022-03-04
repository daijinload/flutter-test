import 'package:flutter/material.dart';
import 'package:flutter_main/views/4_component/text_button.dart';

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
          children: <Widget>[
            const Text('Bページ!!'),
            const SizedBox(height: 30),
            createTextButton(context, '/', 'トップへ'),
          ],
        ),
      ),
    );
  }
}
