import 'package:flutter/material.dart';

/// ### 概要
///
/// - 指定した位置に指定したコンポーネントを配置する
///
/// ### 目的
///
/// - bottomNavigationBarで垂直にコンポーネントが配置されるように作成
///
/// ### 使用例
///
/// - ほぼ全画面
/// - 主に、画面遷移の際のボタンを配置するときに使用

Container createBottomLayout({required List<Widget> children}) {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      children: children,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
    ),
  );
}
