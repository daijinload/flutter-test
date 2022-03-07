import 'package:flutter/material.dart';

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
                      style:
                          TextStyle(color: Color.fromARGB(255, 163, 163, 164))),
                  margin: const EdgeInsets.only(top: 9, bottom: 42)),
              Container(
                margin: const EdgeInsets.only(bottom: 42),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.help_outline,
                      color: Color.fromARGB(255, 138, 138, 138),
                    ),
                    Text("ヘルプページはこちら",
                        style: TextStyle(
                            color: Color.fromARGB(
                          255,
                          104,
                          104,
                          105,
                        )))
                  ],
                ),
              ),
              Container(
                  child: const Text("ライセンス情報",
                      style:
                          TextStyle(color: Color.fromARGB(255, 104, 104, 105))),
                  margin: const EdgeInsets.only(
                    top: 20,
                  ))
            ]),
          ]),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Text.rich(TextSpan(
                  style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
                  children: [
                    TextSpan(
                        text: "利用規約",
                        style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(
                      text: "と",
                    ),
                    TextSpan(
                        text: "プライバシーポリシー",
                        style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: "に同意の上、二次元バーコードの読み込みを開始してください。")
                  ])))
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Color(int.parse("FF" "686869", radix: 16))),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
        height: 50,
        child: TextButton(
            onPressed: (() => {}),
            child: const Text(
              "二次元バーコードを読み込む",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
