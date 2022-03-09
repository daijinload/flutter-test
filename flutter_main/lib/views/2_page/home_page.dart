import 'package:flutter/material.dart';
import 'package:flutter_main/views/4_component/text_button.dart';
import 'package:flutter_main/views/4_component/bottom_navigation_bar_layout.dart';
import 'package:flutter_main/views/3_template/custum_colors.dart';

//ホーム画面
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                const Icon(
                  Icons.abc,
                  size: 220,
                ),
                Container(
                    child: const Text("管理アプリ"),
                    margin: const EdgeInsets.only(top: 24, bottom: 9)),
                Container(
                    child: const Text("0.5.0(1234)",
                        style: TextStyle(color: CustumColors.grayLight)),
                    margin: const EdgeInsets.only(top: 9, bottom: 42)),
                Container(
                  margin: const EdgeInsets.only(bottom: 42),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.help_outline,
                        color: CustumColors.grayIcon,
                      ),
                      Text("ヘルプページはこちら",
                          style: TextStyle(color: CustumColors.gray))
                    ],
                  ),
                ),
                Container(
                    child: const Text("ライセンス情報",
                        style: TextStyle(color: CustumColors.gray)),
                    margin: const EdgeInsets.only(
                      top: 20,
                    ))
              ]),
            ]),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
                child: const Text.rich(TextSpan(
                    style: TextStyle(color: CustumColors.grayHeavy),
                    children: [
                      TextSpan(
                          text: "利用規約",
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(
                        text: "と",
                      ),
                      TextSpan(
                          text: "プライバシーポリシー",
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: "に同意の上、二次元バーコードの読み込みを開始してください。"),
                    ])))
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )),
        bottomNavigationBar: createBottomLayout(children: [
          Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                child: createActionButton(
                    txt: "二次元バーコードを読み込む", onPressed: () => {}),
                height: 50,
                width: double.infinity,
              )),
        ]));
  }
}
