import 'package:flutter/material.dart';
import 'package:flutter_main/views/3_template/custum_colors.dart';

// 丸数字(①、②...)を表示するコンポーネント
Container createEncircledNumber({required String num}) {
  return Container(
    alignment: Alignment.center,
    width: 24,
    height: 24,
    child: SizedBox(
      child: Text(
        num,
        style: const TextStyle(
            color: CustumColors.grayLight, fontWeight: FontWeight.bold),
      ),
    ),
    decoration: BoxDecoration(
      color: CustumColors.grayBg,
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
