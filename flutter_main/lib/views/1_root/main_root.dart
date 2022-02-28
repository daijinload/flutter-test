import 'package:flutter/material.dart';
import 'package:flutter_main/views/2_page/user_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainRoot extends StatelessWidget {
  const MainRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', ''),
      ],
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      home: const UserPage(title: 'Flutter Demo Home Page'),
    );
  }
}
