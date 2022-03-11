import 'package:flutter/material.dart';
import 'package:flutter_main/views/4_component/text_button.dart';
import 'package:flutter_main/views/4_component/bottom_navigation_bar_layout.dart';
import 'package:flutter_main/views/4_component/stepper_indicator_vertical.dart';
import 'package:flutter_main/views/3_template/custum_colors.dart';

// 導入前確認画面_共用玄関
class DeviceSettingPage extends StatefulWidget {
  const DeviceSettingPage({Key? key}) : super(key: key);
  @override
  State<DeviceSettingPage> createState() => DeviceSettingPageState();
}

class DeviceSettingPageState extends State<DeviceSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('機器の設定'),
          backgroundColor: CustumColors.grayHeavy,
        ),
        body: Center(
            child: Column(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 32),
                  child: const Icon(
                    Icons.abc,
                    size: 44,
                  ),
                  decoration: BoxDecoration(
                    color: CustumColors.grayBg,
                    borderRadius: BorderRadius.circular(10),
                  )),
              Container(
                child: const Text("ドエル南麻布/メインエントランス"),
                margin: const EdgeInsets.only(top: 10),
              ),
            ]),
          ]),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 19),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: const Text(
                      "利用する機器を設定します",
                      style: TextStyle(
                          color: CustumColors.grayHeavy,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    margin: const EdgeInsets.only(top: 24)),
                Container(
                    child: const Text(
                      "下記の順で設定を進めます。作業を途中で中断すると、最初からやり直しになります。完了まで行って下さい。",
                    ),
                    margin: const EdgeInsets.only(
                      top: 20,
                    ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 19, top: 36),
            child: Column(
              children: createStepperIndicatorVertical(children: [
                const Text("共用玄関用キーパッドの設定"),
                const Text("解錠テスト"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("ハブの設定"),
                    Text("ハブがある場合は必須",
                        style: TextStyle(
                            color: CustumColors.grayLight, fontSize: 12))
                  ],
                )
              ]),
            ),
          ),
        ])),
        bottomNavigationBar: createBottomLayout(children: [
          Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                child: createActionButton(txt: "はじめる", onPressed: () => {}),
                height: 50,
                width: double.infinity,
              )),
        ]));
  }
}
