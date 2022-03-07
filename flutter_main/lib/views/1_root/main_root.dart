import 'package:flutter/material.dart';
import 'package:flutter_main/views/2_page/aa_page.dart';
import 'package:flutter_main/views/2_page/main_page.dart';
import 'package:flutter_main/views/2_page/bb_page.dart';
import 'package:flutter_main/views/2_page/user_page.dart';
import 'package:flutter_main/views/2_page/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainRoot extends StatelessWidget {
  const MainRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createMaterialApp(context, const MainPage());
  }
}

// テスト側でもMaterialAppを作成したいので、メソッド分割している
MaterialApp createMaterialApp(BuildContext context, Widget homeWidget) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      // 2022.02.28現在、Linuxデスクトップでは絵文字が豆腐になるので試しにフォントを
      // 指定してみたが、Androidのエミュレータだと表示されているので、環境依存っぽい。
      // フォントは組み込みは可能でも、再頒布禁止のものが多く、githubに上げる場合は気をつけること。
      // fontFamily: 'hoge'
    ),
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('ja', ''),
    ],
    home: homeWidget,
    routes: <String, WidgetBuilder>{
      '/a': (BuildContext context) => const AaPage(),
      '/b': (BuildContext context) => const BbPage(),
      '/user/info': (BuildContext context) => const UserPage(),
      '/user/home': (BuildContext context) => const HomePage(),
    },
  );
}
