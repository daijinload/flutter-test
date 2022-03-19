import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> showSystemErrorDialog(
    BuildContext ctx, String message, String stacktrace,
    [Function? onPressedOk]) async {
  // 環境変数でスタックトレースを出すかどうか？決められるようにしたい。
  final viewMessage = message + stacktrace;

  return await showDialog<void>(
    context: ctx,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: const Text('システムエラー'),
        content: Text(viewMessage),
        scrollable: true,
        actions: <Widget>[
          TextButton(
            child: const Text('コピー'),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: viewMessage)).then((_) {
                ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
                    content: Text("error messeges copied to clipboard")));
              });
            },
          ),
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
