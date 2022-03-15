import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ### 概要
///
/// - カタログを作成する時に使用
///
/// ### 目的
///
/// - デザイン一覧画面でコンポーネントのタイトルを付けやすくするため
///
/// ### 利用例
///
/// - デザイン一覧画面
///
/// ### 備考
///
/// - 引数のimportPathには、タイトルがクリックされたときにクリップボードにコピーされるテキストを与える
///

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

/// ### 概要
///
/// - 引数で与えられた色情報を元に色を円形に表示する
///
/// ### 目的
///
/// - デザイン一覧画面で色を簡単に表示するために作成
///
/// ### 利用例
///
/// - デザイン一覧画面
///
/// ### 備考
///
/// - 引数のpropsには、色がクリックされたときにクリップボードにコピーしたいテキストを与える
///

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
