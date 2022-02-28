import 'package:flutter/material.dart';

Future<void> showSystemErrorDialog(BuildContext ctx, String message,
    [Function? onPressedOk]) async {
  return await showDialog<void>(
    context: ctx,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: const Text('システムエラー'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('閉じる'),
            onPressed: () {
              if (onPressedOk != null) {
                onPressedOk();
              }
              Navigator.of(ctx).pop();
            },
          ),
        ],
      );
    },
  );
}
