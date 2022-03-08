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

ElevatedButton createActionButton(
    {void Function()? onPressed, required String txt, bool outlined = false}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(txt),
    style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 104, 104, 105),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        )),
  );
}
