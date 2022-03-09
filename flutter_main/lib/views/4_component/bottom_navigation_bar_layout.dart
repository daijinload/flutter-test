import 'package:flutter/material.dart';

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
