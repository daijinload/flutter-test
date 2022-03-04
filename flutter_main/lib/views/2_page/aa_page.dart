import 'package:flutter/material.dart';

class AaPage extends StatefulWidget {
  const AaPage({Key? key}) : super(key: key);
  @override
  State<AaPage> createState() => AaPageState();
}

class AaPageState extends State<AaPage> {
  String str = "ボタンを押してください。";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(str),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  str = 'ボタンが押されました🌠🌠🌠';
                });
                debugPrint('ボタン1 clicked');
              },
              child: const Text('ボタン1'),
            ),
            const SizedBox(height: 30),
            TextButton(
                style: TextButton.styleFrom(
                  // textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.green,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/b');
                },
                child: const Text('次の画面へ')),
          ],
        ),
      ),
    );
  }
}
