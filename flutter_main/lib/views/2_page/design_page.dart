import 'package:flutter/material.dart';
import 'package:flutter_main/views/4_component/text_button.dart';
import 'package:flutter_main/views/4_component/design_catalog_component.dart';
import 'package:flutter_main/views/3_template/custum_colors.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({Key? key}) : super(key: key);
  @override
  State<DesignPage> createState() => DesignPageState();
}

class DesignPageState extends State<DesignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('デザイン一覧画面'),
      ),
      body: Center(
          child: Column(
        children: [
          createCatalogBlock(
              title: "色一覧",
              children: [
                createColorBlock(
                    title: "grayHeavy",
                    color: CustumColors.grayHeavy,
                    props: "CustumColors.grayHeavy"),
                createColorBlock(
                    title: "gray",
                    color: CustumColors.gray,
                    props: "CustumColors.gray"),
                createColorBlock(
                    title: "grayIcon",
                    color: CustumColors.grayIcon,
                    props: "CustumColors.grayIcon"),
                createColorBlock(
                    title: "grayLight",
                    color: CustumColors.grayLight,
                    props: "CustumColors.grayLight"),
              ],
              importPath:
                  "import 'package:flutter_main/views/3_template/custum_colors.dart'"),
          createCatalogBlock(
              children: [
                createTextButton(context, "/designs", "createTextButton"),
                createActionButton(
                    txt: "createActionButton", onPressed: () => {})
              ],
              title: "ボタン",
              importPath:
                  "import 'package:flutter_main/views/4_component/text_button.dart'")
        ],
      )),
    );
  }
}
