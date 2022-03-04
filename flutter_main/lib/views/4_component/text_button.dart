import 'package:flutter/material.dart';

// テキストボタンを作成する（htmlで言う所のaタグとなる。）
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
