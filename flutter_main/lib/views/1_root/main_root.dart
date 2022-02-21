import 'package:flutter/material.dart';
import 'package:flutter_main/views/2_page/user_page.dart';

class MainRoot extends StatelessWidget {
  const MainRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      home: const UserPage(title: 'Flutter Demo Home Page'),
    );
  }
}
