import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// カタログを作成する時に使用
Column createCatalogBlock(
    {required List<Widget> children,
    required String title,
    // 開発時、importパスをコピーするときに使用
    String? importPath}) {
  return Column(
    children: [
      Row(children: [
        OutlinedButton(
            onPressed: () =>
                {Clipboard.setData(ClipboardData(text: importPath))},
            child: Text(title)),
      ], mainAxisAlignment: MainAxisAlignment.center),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      )
    ],
  );
}

Column createColorBlock(
    {required String title,
    required Color color,
    // 開発時、コピペしやすいように使用
    String? props}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              child: ElevatedButton(
                child: const Text(''),
                style: ElevatedButton.styleFrom(
                  primary: color,
                  shape: const CircleBorder(),
                ),
                onPressed: () =>
                    {Clipboard.setData(ClipboardData(text: props))},
              ),
              width: 50,
              height: 50,
            ),
            Text(title)
          ],
        ),
      )
    ],
  );
}
