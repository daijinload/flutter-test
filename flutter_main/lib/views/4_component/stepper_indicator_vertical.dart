import 'package:flutter/material.dart';
import 'package:flutter_main/views/4_component/encircled_number.dart';
import 'package:flutter_main/views/3_template/custum_colors.dart';

// ステッパーのアクションボタンをなくしたもの
// https://api.flutter.dev/flutter/material/Stepper-class.html
List<Column> createStepperIndicatorVertical({required List<Widget> children}) {
  return children
      .asMap()
      .entries
      .map((e) => (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    createEncircledNumber(num: (e.key + 1).toString()),
                    SizedBox(
                      child: (Visibility(
                          visible: (children.length != e.key + 1),
                          child: const VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 2,
                              endIndent: 6,
                              color: CustumColors.gray))),
                      width: 30,
                      height: 30,
                    )
                  ]),
                  Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [e.value],
                      )),
                ],
              ),
            ],
          )))
      .toList();
}
